<?php
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}
// include dirname(__DIR__) . "/utils/helper.php";
include "data-collector.php";

$totalPoints = 0;

foreach ($_SESSION as $key => $data) {

    if (isset($data['single-choice']) && $data['single-choice'] === "1") {
        $totalPoints += 1;
    } else {
        $counter = 0;
        for ($i = 1; $i <= 5; $i++) {

            if (isset($data["answer"]) && $data["answer"] === '1') {
                $counter += 1;
            } else if (isset($data["answer"]) && $data["answer"] === '0') {
                $counter -= 1;
            } else {
                $counter += 0;
            }
        }
    }
    $totalPoints += $counter;
}


// $procent = round(($totalPoints / (count($_SESSION))) * 100, 2);
$procent = round(($totalPoints / (intval($_GET['questionNum']))) * 100, 2);

// var_dump($procent, $totalPoints, $_GET['questionNum']);

if ($procent > 100) {
    $procent = 100;
} else if ($procent < 0) {
    $procent = $totalPoints = 0;
}
// TODO: DATABASE FOR MOST DIFFICULT QUESTIONS AND MOST DIFFICULT TOPICS + JS PIE VISUALIZATION

// add data in new table for visualization
$topic = $_SESSION['quiz']['topic'];
addStatistic($topic, $procent, $dbConnection);



// fetching data for the graphs
global $dbConnection;

$query = "SELECT topic AS Topic, repeated AS Anzahl  FROM statistic ORDER BY CONVERT(Anzahl,UNSIGNED) DESC LIMIT 4";
$sqlStatement = $dbConnection->prepare($query);
$sqlStatement->execute();
$row = $sqlStatement->fetchAll(PDO::FETCH_ASSOC);
// asort($row['Anzahl']);
// var_dump($row[0]['Topic']);
$fp = fopen('data-beliebte-themen.csv', 'w');
// write column names

fputcsv($fp, ['Topic', 'Anzahl']);
// end write columns names
foreach ($row as $data) {
    fputcsv($fp, $data);
}

fclose($fp);
// $keys = array_keys($row[0]);

// var_dump($keys);

// echo "<pre style='font-size:2rem; color:red;font-weight:900;'";
// var_dump($row);
// echo "</pre>";

// $repeatedQuiz = $totalStatisticSubject[0]['repeated'];
// $totalProcentQuiz = $totalStatisticSubject[0]['procent'];
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>report</title>
    <link rel="stylesheet" href="../styles.css">
    <!-- <script src="https://d3js.org/d3-scale-chromatic.v1.min.js"></script> -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@100;200;300;400;500;600;700;800;900&family=Kanit:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">






    <!-- <script src="https://d3js.org/d3.v6.js"></script> -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>



    <!-- <script src="https://d3js.org/d3.v6.js"></script> -->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>

</head>

<body>
    <div class="container">
        <?php include "header.php"; ?>
        <div class="main-container">
            <main>
                <h1 class="report-title">Report</h1>
                <section id="report-upper">
                    <section id="report-container">
                        <!-- Roger's Chart From W3schools animiert [x] und ohne flackern [x] ------ -->
                        <div class="canvas-container">
                            <canvas id="myChart" style="width:100%;max-width:600px"></canvas>
                        </div>


                        <!-- End of Roger's Chart -->
                        <h1 id="report"><?php echo "$procent% Percent korrect<br>Total Points: $totalPoints"; ?></h1>
                    </section>




                    <!-- <button onclick="update(data1)">Data 1</button>
                    <button onclick="update(data2)">Data 2</button>
                    <div id="my_dataviz"></div> -->

                    <div class="schrift">
                        <h2 class="zeitschrift">Zeitschrift Abbonieren</h2>
                        <button id="abbonieren">Abbonieren</button>
                    </div>


                    <div id="myModal" class="modal">
                        <div class="modal-content">

                            <span class="close">&times;</span>
                            <form class="start-quiz" method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>">
                                <label for="name">Name</label>
                                <input type="text" name="name" id="name">
                                <label for="name">E-mail</label>
                                <input type="email" name="email">
                                <span class="error"> <?php if (!empty($emailErr)) {
                                                            echo $emailErr;
                                                        } else {
                                                            echo "";
                                                        }; ?></span>
                                <br><br>
                                <input type="submit" name="submit" value="Abbonieren">
                            </form>
                        </div>

                    </div>

                </section>
            </main>
        </div>
        <?php include "footer.php" ?>

    </div>
    <script src="../script.js"></script>
    <script src="../pie.js"></script>
    <script>
        const yRichtig = <?php echo $procent ?>;
        const yFalsch = 100 - <?= $procent ?>;
        const xValues = ["Richtig", "Falsch"];
        const yValues = [yRichtig, yFalsch];
        const barColors = [
            "#6b806f",
            "#ff0532"
        ];

        new Chart("myChart", {
            type: "pie",
            data: {
                labels: xValues,
                datasets: [{
                    backgroundColor: barColors,
                    data: yValues,
                    color: "#9BD0F5",

                }]
            },
            options: {
                title: {
                    display: true,
                    text: "Percent"
                }
            }
        });
    </script>
    <script type="text/javascript">
        google.charts.load('current', {
            'packages': ['corechart']
        });
        google.charts.setOnLoadCallback(drawChart);

        function drawChart() {
            const procent = <?php echo $totalProcentQuiz / $repeatedQuiz ?>;
            const users = <?php echo $repeatedQuiz ?>;
            var data = google.visualization.arrayToDataTable([
                ['Answer', 'procent'],
                ['Correct', procent],
                ['False', 100 - procent],
            ]);

            var options = {
                title: 'Total accuracy done by ' + users + ' users',
                legend: {
                    textStyle: {
                        color: '#6B7280'
                    }
                }, // Set legend text color
                backgroundColor: 'transparent',
                colors: ['#6B7280', '#cc3232']
            };

            var chart = new google.visualization.PieChart(document.getElementById('piechart'));

            chart.draw(data, options);
        }

        // second chart of all users answer in the same topic
        // const xValuesall = ['Correct', 'False'];
        // const totalprocent = <?php echo $totalProcentQuiz / $repeatedQuiz ?>;
        // const yValuesall = [totalprocent, 100-totalprocent];
        // const barColors = [
        // "#6b806f",
        // "#cc3232"
        // ];

        // new Chart("piechart", {
        // type: "pie",
        // data: {
        //     labels: xValuesall,
        //     datasets: [{
        //     backgroundColor: barColors,
        //     data: yValuesall
        //     }]
        // },
        // options: {
        //     title: {
        //     display: true,
        //     text: 'Total accuracy done by ' + procent + 'users'
        //     }
        // }
        // });
    </script>

</body>

</html>