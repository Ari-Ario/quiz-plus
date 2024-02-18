<?php

if (session_status() === PHP_SESSION_NONE) {
    session_start();
}
session_destroy();

include_once "includes/db.php";


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
                <form class="start-quiz" action="/includes/question.php" method="GET">
                    <div class="in-group">
                        <label for="topic">Select a topic:</label>
                        <select name="topic" id="topic">
                            <option value="cinema">Cinema</option>
                            <option value="tech">Technic</option>
                            <option value="animals">Animals</option>
                            <option value="astronomy">astronomy</option>
                            <option value="geography">Geography</option>
                        </select>
                    </div>


                    <div class="in-group">
                        <label for="questionNum"># of questions:</label>
                        <input type="number" name="questionNum" id="questionNum" value="10" min="1">
                        <span class="error"> <?php echo $numberErr = ''; ?></span>
                    </div>
                    <div class="in-group">
                        <input type="hidden" name="lastQuestionIndex" id="lastQuestionIndex" value="-1">
                        <input type="hidden" name="IndexStep" id="IndexStep" value="1">
                        <input type="submit" id="start-btn" value="Start Quiz">
                    </div>


                </form>
                <form class="debug-form" action="/includes/test.php" method="POST">
                    <input type="submit" value="tables">
                </form>
                <div class="beliebte-themen">
                    <p class="graph-slogan">Beliebte Themen </p>
                    <div id="beliebte-themen-chart">

                    </div>

                </div>
            </main>
        </div>




        <?php include './includes/footer.php' ?>

        <script src="script.js"></script>


        <script src="charts.js"></script>



    </div>
</body>

</html>