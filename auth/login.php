<?php
if (session_status() === PHP_SESSION_NONE) {
    // Starte die Session
    session_start();
}


include_once '../database/pdoConnection.php';
// include_once '../components/header.php';

$_SESSION['credentialErrors'][0] = "";
$_SESSION['credentialErrors'][1] = "";


if (isset($_POST["submit"]) && $_SERVER['REQUEST_METHOD'] == 'POST') {

    if (!validateUsername($_POST['username']) || !validatePassword($_POST['password'])) {
        if (!validateUsername($_POST['username'])) {
            $_SESSION['credentialErrors'][3] = 'wrong username or password' ?? '';
        }
        $_SESSION['credentialErrors'][3] = 'wrong username or password' ?? '';
        header('Location: ../index.php');
        return false;
    }

    login($_POST['username'], $_POST['password']);
}




// Test POST returns username and password
// echo "<pre>" . "<br>" . $loginUser . "<br>" . $loginPass;





function login($username, $password)
{
    $username = sanitizeInput($username);
    $password = sanitizeInput($password);
    global $dbConn;

    try {

        $testUser = "SELECT name,password FROM users WHERE name=:username";

        $userExists = $dbConn->prepare($testUser);
        $userExists->bindParam(':username', $username);
        $userExists->execute();
        $user = $userExists->fetch(PDO::FETCH_ASSOC);
        // echo "<pre>";
        // print_r(!$user);
        // echo "</pre>";
    } catch (\PDOException $error) {

        echo "Query Error" . $error->getMessage();
    }

    if (!$user) {
        $_SESSION['credentialErrors'][3] = 'wrong username or password' ?? '';
        header('Location: ../index.php');

        return false;
    } elseif ($username == $user['name'] && password_verify($password, $user['password'])) {
        $_SESSION['username'] = $username;
        header('Location: ../welcome.php');
        return true;
    }
    header('Location: ../index.php');
    // $_SESSION['credentialErrors'][2] = 'wrong username or password' ?? '';

    return false;
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

// sanitize input by removing extra space backslash and html chars(html injection,sql injection)
function sanitizeInput($input)
{
    $input = trim($input);
    $input = stripslashes($input);
    $input = htmlspecialchars($input);
    return $input;
}
