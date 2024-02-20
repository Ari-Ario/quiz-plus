<?php
if (session_status() === PHP_SESSION_NONE) {
    // Starte die Session
    session_start();
}

include_once "database/pdoConnection.php";

global $dbConn;

$query = "SELECT * FROM users";
$query = $dbConn->prepare($query);
$query->execute();
$result = $query->fetchAll(PDO::FETCH_ASSOC);

// echo "<pre>";
// var_dump($result);
// var_dump($_SESSION['credentialErrors']);
// var_dump($_SESSION);
// echo "<br></pre>";

?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>QUIZ</title>
    <link rel="stylesheet" href="styles.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@100;200;300;400;500;600;700;800;900&family=Kanit:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">

    <script src="https://d3js.org/d3.v6.js"></script>
</head>

<body>

    <div class="container">
        <?php include './includes/header.php'; ?>
        <div class="main-container">
            <main>

                <div class="title">
                    <h1 class="title">ARAM</h1>
                    <p class="slogan">Erweitere dein <br> Allgemein Wissen <br> mit ARAM</p>
                </div>


                <form class="start-quiz" action=" auth/login.php" method="POST">

                    <?php
                    if (isset($_SESSION['credentialErrors'][3])) {
                        echo "<p class='error'>" . $_SESSION['credentialErrors'][3]  . "</p>" ?? '';
                    }
                    ?>
                    <div class="in-group">
                        <label for="username">username</label>
                        <input type="text" name="username" id="username">
                    </div>

                    <?php //echo "<p class='error'>" . $_SESSION['credentialErrors'][0]  . "</p>"; 
                    ?>
                    <div class="in-group">
                        <label for="password">password</label>
                        <input type="password" name="password" id="password">
                    </div>

                    <?php //echo "<p class='error'>" . $_SESSION['credentialErrors'][1] . "</p>"; 
                    ?>
                    <div class="in-group">
                        <input type="submit" value="login" name="submit">
                    </div>
                </form>
                <a class="info" href="signup.php">Don't have an account yet? sign up now!</a>

            </main>
        </div>




        <?php include './includes/footer.php' ?>

        <script src="script.js"></script>


        <script src="charts.js"></script>
</body>
<?php echo '<script src="assets/js/script.js"></script>';


// $_SESSION['credentialErrors'][0] = "";
// $_SESSION['credentialErrors'][1] = "";
$_SESSION['credentialErrors'][3] = "";




?>

</html>