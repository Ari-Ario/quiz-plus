<?php
if (session_status() === PHP_SESSION_NONE){
    session_start();
}
include dirname(__DIR__) . "/utils/helper.php";
// prettyPrint($_SESSION);
// exit();
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
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>report</title>
    <link rel="stylesheet" href="../styles.css">

</head>
<body>
<?php include "header.php"; ?>
<section id="form-quiz">
    <section id="form-container">
    <h1 id="report"><?php echo "you answered $procent procent of the questions correctly with total points: $totalPoints" ; ?></h1>

    </section>
</section>

<?php include "footer.php" ?>
<script src="../script.js"></script>
</body>
</html>