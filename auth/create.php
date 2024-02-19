<?php
if (session_status() === PHP_SESSION_NONE) {
    // Starte die Session
    session_start();
}


include_once '../database/pdoConnection.php';
// include_once '../components/header.php';

$_SESSION['credentialErrors'][0] = "";
$_SESSION['credentialErrors'][1] = "";
$_SESSION["credentialErrors"][2] = "";
$_SESSION["credentialErrors"][3] = "";
$_SESSION["credentialErrors"][4] = "";
$_SESSION["credentialErrors"][5] = "";
$_SESSION["credentialErrors"]['created'] = "";


if (isset($_POST["create"]) && $_SERVER['REQUEST_METHOD'] == 'POST') {

    if (!validateUsername($_POST['username']) || !validatePassword($_POST['password']) || !filter_var($_POST['email'], FILTER_VALIDATE_EMAIL)) {
        if (!validateUsername($_POST['username'])) {
            $_SESSION['credentialErrors'][0] = "Username must be at least 5 Chars(a-Z0-9_-)" ?? "";
        }
        if (!validatePassword($_POST['password'])) {
            $_SESSION['credentialErrors'][1] = "password must be at least 8 Chars and must include (a-zA-Z0-9#?&/)" ?? "";
        }
        if (!filter_var($_POST['email'], FILTER_VALIDATE_EMAIL)) {
            $_SESSION['credentialErrors'][2] = "E-mail not valid" ?? "";
        }

        header('Location: ../signup.php');
        return false;
    }

    signUp($_POST['username'], $_POST['email'], $_POST['password']);
}




// Test POST returns username and password
// echo "<pre>" . "<br>" . $loginUser . "<br>" . $loginPass;





function signUp($username, $email, $password)
{
    $username = sanitizeInput($username);
    $email = filter_var($email, FILTER_SANITIZE_EMAIL);
    $password = sanitizeInput($password);
    global $dbConn;

    try {

        $testUser = "SELECT name,password,email FROM users WHERE name=:username OR email=:email";

        $userExists = $dbConn->prepare($testUser);
        $userExists->bindParam(':username', $username, PDO::PARAM_STR);
        $userExists->bindParam(':email', $email, PDO::PARAM_STR);

        $userExists->execute();
        $user = $userExists->fetch(PDO::FETCH_ASSOC);
        ////debug
        // echo "<pre>";
        // print_r(!$user);
        // if (!$user) {
        //     echo "not";
        //     print_r($user['name']);
        // } elseif ($user) {
        //     echo "yes";
        //     print_r($user['name']);
        //     print_r($user);
        //     print_r($user['email']);
        // }
        // echo "</pre>";
        // return false;
    } catch (\PDOException $error) {

        echo "Query Error" . $error->getMessage();
    }

    if ($user) {

        if ($user["name"] == $username) {

            $_SESSION['credentialErrors'][4] = 'username already exists' ?? '';
            header('Location: ../signup.php');
            return false;
        } elseif ($user["email"] == $email) {
            $_SESSION['credentialErrors'][5] = 'email already exists' ?? '';
            header('Location: ../signup.php');
            return false;
        }
    } elseif (!$user) {
        $_SESSION['credentialErrors']['created'] = "You have successfuly created an account!" ?? '';
        $password = password_hash($password, PASSWORD_DEFAULT);
        $newUser = "INSERT INTO users(name,password,email)values(:username ,:password,:email)";

        $InsertUser = $dbConn->prepare($newUser);
        $InsertUser->bindParam(':username', $username, PDO::PARAM_STR);
        $InsertUser->bindParam(':password', $password, PDO::PARAM_STR);

        $InsertUser->bindParam(':email', $email, PDO::PARAM_STR);

        $InsertUser->execute();
        // $user = $userExists->fetch(PDO::FETCH_ASSOC);

        header('Location: ../signup.php');
        return true;
    }
}





//username must be at  least 5 and max 12 chars and can contain alphanumerics and -
function validateUsername($username)
{
    $regex = '/[^a-zA-z0-9_-]/';


    if (preg_match($regex, $username) || strlen($username) < 5 || strlen($username) > 12) {
        // echo "username not valid";
        return false;
    }

    // echo "valid username<br>";
    return true;
}




function validatePassword($password)
{
    // check for at least 8 and max 16 chars must contain (capital letters, small letters,numbers,&/#-?)

    $regex = "/^(?=.*[0-9])(?=.*[A-Z])(?=.*[a-z])(?=.*[$\/#?])(?!\s)[A-Za-z0-9$\/#?]{8,16}$/";
    if (!preg_match($regex, $password)) {
        // echo "password not safe<br>";
        return false;
    }
    // echo "password safe";
    return true;
}

echo validatePassword("");
// sanitize input by removing extra space backslash and html chars(html injection,sql injection)
function sanitizeInput($input)
{
    $input = trim($input);
    $input = stripslashes($input);
    $input = htmlspecialchars($input);
    return $input;
}
