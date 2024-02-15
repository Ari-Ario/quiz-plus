<?php
if (session_status() === PHP_SESSION_NONE){
    session_start();
}
include dirname(__DIR__) . "/utils/helper.php";
include "data-collector.php";

$totalPoints = 0;
foreach ($_SESSION as $key => $data) {
    if (isset($data['single-choice']) && $data['single-choice'] === "1") {
        $totalPoints += 1;

    } else {
        $counter = 0;
        for ($i = 1; $i <= 5; $i++){

            if (isset($data["answer"]) && $data["answer"] === '1') {
                $counter+=1;
            } else if (isset($data["answer"]) && $data["answer"] === '0') {
                $counter -=1;
            } else {
                $counter += 0;
            }
        }
        $totalPoints += $counter;
    }
}


$procent = round(($totalPoints/(count($_SESSION)-1))*100, 2);
if ($procent > 100) { $procent = 100; }
else if  ($procent < 0) { $procent= $totalPoints = 0; }
// TODO: DATABASE FOR MOST DIFFICULT QUESTIONS AND MOST DIFFICULT TOPICS + JS PIE VISUALIZATION

// add data in new table for visualization
$topic = $_SESSION['quiz']['topic'];
addStatistic($topic, $procent, $dbConnection);
$totalStatisticSubject= takeStatisticSubject($topic, $dbConnection);

$repeatedQuiz = $totalStatisticSubject[0]['repeated'];
$totalProcentQuiz = $totalStatisticSubject[0]['procent'];
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>report</title>
    <link rel="stylesheet" href="../styles.css">
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
    <script type="text/javascript">

      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
        const procent = <?php echo $totalProcentQuiz/ $repeatedQuiz ?>;
        const users = <?php echo $repeatedQuiz ?> ;
        var data = google.visualization.arrayToDataTable([
          ['Answer', 'procent'],
          ['Correct',     procent],
          ['False',      100 - procent],
        ]);

        var options = {
          title: 'Total accuracy done by ' + users + ' users' ,
          backgroundColor: 'transparent',
          colors: ['#6b806f', '#cc3232']
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart'));

        chart.draw(data, options);
      }

        // second chart of all users answer in the same topic
        // const xValuesall = ['Correct', 'False'];
        // const totalprocent = <?php echo $totalProcentQuiz/ $repeatedQuiz ?>;
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
</head>
<body>
<?php include "header.php"; ?>
<section id="form-quiz">
    <section id="form-container">

        <section id="charts">
            <canvas id="myChart" class="piechart" style="  max-width:70%;"></canvas>
            <div id="piechart" class="piechart" style="  max-width:30%;"></div>
        </section>

        <button class="nav-link" onclick="openPopup()">Newsletter</button>

        <section id="popup" class="popup" style="margin: 0; padding: 0;">
            <section class="modal-dialog popup-content" role="document">
                
                    <section class="closing">
                        <span class="close" onclick="closePopup()">&times;</span>
                    </section>

                    <section class="modal-body">
                        <form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
                        <fieldset id="first-fieldset" class="form-floating mb-3">
                            <legend class="legend-popup">Name</legend>
                            <input name="name" type="text" class="form-control rounded-3" id="name" placeholder="Ari">
                        </fieldset>
                        <fieldset class="form-floating mb-3">
                            <legend class="legend-popup">Email</legend>
                            <input name="email" type="email" class="form-control rounded-3" id="email" placeholder="ari@ario.com">
                        </fieldset>
                        <div id="register-btn">
                            <input id="register" onclick="printOutput()" style="max-width: 50%;" type="submit" value="Register">
                        </div>
                        </form>
                    </section>
            </section>
        </section>
        <span class="error"> <?php if (!empty($emailErr)) {echo $emailErr;} else {echo "";};?></span>

    </section>
</section>

<?php include "footer.php" ?>
<script src="../script.js"></script>
<script type="text/javascript">

    // first chart of the user
        const xValues = ['Correct', 'False'];
        const procent = <?php echo $procent; ?>;
        const yValues = [procent, 100-procent];
        const barColors = [
        "#6b806f",
        "#cc3232"
        ];

        new Chart("myChart", {
        type: "pie",
        data: {
            labels: xValues,
            datasets: [{
            backgroundColor: barColors,
            data: yValues
            }]
        },
        options: {
            title: {
            display: true,
            text: "Quiz result"
            }
        }
        });

</script>
</body>
</html>