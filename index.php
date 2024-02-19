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
                    <option value="music">Music</option>
                    <option value="science">Science</option>
                    <option value="basketball">Basketball</option>
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
            <!-- <form action="/includes/test.php" method="POST">
            <input type="submit" value="table"> -->

            <form action="/includes/mailer.php" method="POST">
                <input type="submit" value="mailer">
            </form>
            
            <?php
                include "includes/db.php";
                $allColumns = takeSatatisticsMain($dbConnection);
                if (count($allColumns) < 3) {
                    if (count($allColumns) === 2){
                        $firstTopic = $allColumns[0]['topic'];
                        $firstStatistic = $allColumns[0]['repeated'];
                        $secondTopic = $allColumns[1]['topic'];
                        $secondStatistic = $allColumns[1]['repeated'];
                        $thirdTopic = "";
                        $thirdStatistic = 0;
                    } else if (count($allColumns) === 1) {
                        $firstTopic = $allColumns[0]['topic'];
                        $firstStatistic = $allColumns[0]['repeated'];
                        $secondTopic = $thirdTopic = "";
                        $secondStatistic = $thirdStatistic = 0;
                    } else if (count($allColumns) === 0) {
                        $firstTopic = $secondTopic = $thirdTopic = "";
                        $firstStatistic = $secondStatistic = $thirdStatistic = 0;}
                } else {
                    $firstTopic = $allColumns[0]['topic'];
                    $firstStatistic = $allColumns[0]['repeated'];
                    $secondTopic = $allColumns[1]['topic'];
                    $secondStatistic = $allColumns[1]['repeated'];
                    $thirdTopic = $allColumns[2]['topic'];
                    $thirdStatistic = $allColumns[2]['repeated'];
                }
/*                 print_r($allColumns);
                echo "$firstTopic, $secondTopic, $thirdStatistic";
                exit(); */
            ?>
            <div id="cahrt-main"><canvas id="selectionChart"></canvas></div>
        </section>
    </section>
</main>

    <?php include './includes/footer.php';?>
    
    <script src="script.js"></script>
    <script>
    const xValues = ["<?php echo $firstTopic; ?>", "<?php echo $secondTopic ?>", "<?php echo $thirdTopic ?>"];
    const yValues = [<?php echo $firstStatistic ?>, <?php echo $secondStatistic ?>, <?php echo $thirdStatistic ?>];
    const barColors = [
        'rgba(255, 99, 132, 0.2)',
        'rgba(255, 159, 64, 0.2)',
        'rgba(75, 192, 192, 0.2)'
        ];

    new Chart("selectionChart", {
    type: "bar",
    data: {
        labels: xValues,
        datasets: [{
        backgroundColor: barColors,
        data: yValues,
        borderColor: [
        'rgb(255, 99, 132)',
        'rgb(255, 159, 64)',
        'rgb(75, 192, 192)'
        ],
        borderWidth: 1
        }],
    },
    options: {
        indexAxis: 'y',
        legend: {
            fontColor: '#eeeeee',
            //display: false
            labels: {
                text: xValues[0],
                fontColor: 'transparent', // change legend label color
                // fontFamily: 'Arial', // change legend label font family
                //fontSize: 16, // change legend label font size
                // fontStyle: 'italic' // change legend label font style
            }
        },
        title: {
        display: true,
        text: "Most selected Topics",
        fontColor: '#eeeeee'
        },
        scales: {
            yAxes: [{
                ticks: {
                    fontColor: '#e7b416' // change Y axis tick color
                }
            }],
            xAxes: [{
                ticks: {
                    fontColor: '#e7b416' // change X axis tick color
                }
            }]
        },
    }
    });
    </script>
</body>
</html>