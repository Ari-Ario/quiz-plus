<?php

if (session_status() === PHP_SESSION_NONE){
    session_start();
}
session_destroy();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>QUIZ</title>
    <link rel="stylesheet" href="styles.css">
    <script
        src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js">
    </script>
</head>
<body>
    <?php include './includes/header.php';?>
    <main id="main">
    <section id="main-content">

        <section id="man-bubble">
            <section class="head-bubble">
                <div class="thought-bubble">
                    <div class="text">QUIZ?!</div>
                </div>
            </section>

        <section id="form-main-page">
            <form action="/includes/question.php" method="POST">
                <label for="topic">Select a topic:</label>
                <select name="topic" id="topic">
                    <option value="cinema">Cinema</option>
                    <option value="tech">Technic</option>
                    <option value="animals">Animals</option>
                    <option value="astronomy">astronomy</option>
                    <option value="geography">Geography</option>
                </select>
                <br>
                <label for="questionNum"># of questions:</label>
                <input type="number" name="questionNum" id="questionNum" value="10">
                <span class="error"> <?php echo $numberErr = '';?></span>
                <br>
                <input type="hidden" name="lastQuestionIndex" id="lastQuestionIndex" value="-1">
                <input type="hidden" name="IndexStep" id="IndexStep" value="1">
                <input type="submit" id="start-btn" value="Start Quiz">
            </form>
            <form action="/includes/mailer.php" method="POST">
                <input type="submit" value="mailer">
            </form>
            <canvas id="selectionChart" style="max-width:70%;"></canvas>
        </section>
    </section>
</main>

    <?php include './includes/footer.php';?>
    
    <script src="script.js"></script>
    <script>
    const xValues = ["cinema", "Animals", "geography", "astronomy", "etc"];
    const yValues = [55, 49, 44, 24, 15];
    const barColors = ["red", "green","blue","orange","brown"];

    new Chart("selectionChart", {
    type: "bar",
    data: {
        labels: xValues,
        datasets: [{
        backgroundColor: barColors,
        data: yValues
        }]
    },
    options: {
        legend: {display: false},
        title: {
        display: true,
        text: "Most selected Topics"
        }
    }
    });
    </script>
</body>
</html>