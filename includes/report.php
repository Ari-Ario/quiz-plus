<?php
if (session_status() === PHP_SESSION_NONE){
    session_start();
}
include dirname(__DIR__) . "/utils/helper.php";
include "db.php";

// print_r($_SESSION);
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


$procent = round(($totalPoints/(count($_SESSION)))*100, 2);
if ($procent > 100) { $procent = 100; }
else if  ($procent < 0) { $procent= $totalPoints = 0; }
// TODO: DATABASE FOR MOST DIFFICULT QUESTIONS AND MOST DIFFICULT TOPICS + JS PIE VISUALIZATION

// add data in new table for visualization
$topic = $_SESSION['quiz']['topic'];
addStatistic($topic, $procent, $dbConnection);

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

        <button class="nav-link" onclick="openPopup()">Newsletter</button>
            <section id="popup" class="popup" style="margin: 0; padding: 0;">
                <section class="modal-dialog popup-content" role="document">
                    
                        <section class="closing">
                            <span class="close" onclick="closePopup()">&times;</span>
                        </section>

                        <section class="modal-body">
                            <form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
                            <section class="form-floating mb-3">
                                <input name="name" type="text" class="form-control rounded-3" id="name" placeholder="Ari">
                                <label for="name">Name</label>
                            </section>
                            <section class="form-floating mb-3">
                                <input name="email" type="email" class="form-control rounded-3" id="email" placeholder="ari@ario.com">
                                <label for="email">Email</label>
                            </section>
                            <input id="register" onclick="printOutput()" class="w-100 mb-2 btn btn-lg rounded-3 btn-primary" type="submit" value="Register">

                            </form>
                        </section>
                </section>
            </section>
            <span class="error"> <?php if (!empty($emailErr)) {echo $emailErr;} else {echo "";};?></span>

    </section>
</section>

<?php include "footer.php" ?>
<script src="../script.js"></script>
</body>
</html>