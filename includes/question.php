<?php
if (session_status() === PHP_SESSION_NONE){
    session_start();
}

include "data-collector.php";
?>

<!DOCTYPE html>
<html lan="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../styles.css">
</head>
<body>
<?php

    if (isset($quiz['questionIdSequence'])){
        // $id = $current_id;
       
        $id = $quiz['questionIdSequence'][$currentQuestionIndex];
    }
    $question= questionRequest($id, $dbConnection);

// another method to do it 
/*     $question = Array();
    foreach($questionIdSequence as $current_id){
        for ($i=1; $i <= 5; $i++) {
            $answer = "answer_" . $i;
            if ($questions['question_id'] === $current_id && $questions['is_correct'] === "1"){
                array_push($question);
            }
        }
    } */

    // prettyPrint($question);
    // exit();
?>
<?php include "header.php"; ?>
<section id="form-quiz">
    <section id="form-container">
        <section class="header-form">
            <h1><?php echo $question[0]['question_text'] ?></h1>
        </section>
        <section class="header-form">
            <form action="<?php echo $actionUrl; ?>" method="post">
                <?php
                $correct = "";
                foreach ($question as $key => $value){
                    if ($value['is_correct'] === "1"){
                        $correct .= ($key+1) . "," ;
                    }
                }
                // show the answers and compare them with the correct answers
                // prettyPrint($question);
                // $correct = $question['correct'];
                $pattern = "/\s*,\s*/";
                $correctItems = preg_split($pattern, $correct);
                array_pop($correctItems);

                // a flag for multiple-choice / Checkbox and/or single-choice / radio
                if (count($correctItems) > 1) $multipleChoice = true;
                else $multipleChoice = false;
                for ($i = 1; $i <=5; $i++){
                    $j = $i-1;
                    $answerColumnName = "answer";
                    if (isset($question[$j][$answerColumnName]) && !empty($question[$j][$answerColumnName])) {
                        $answerText = $question[$j][$answerColumnName];

                        if (in_array($i, $correctItems)) $value = 1;
                        else $value = 0;
                        echo "<section id='form-check'>\n";
                        if ($multipleChoice) {
                            echo "<input type='checkbox' name='$answerColumnName' id='$answerColumnName' value='$value'>\n";
                        } else{
                            echo "<input type='radio' name='single-choice' id='$answerColumnName' value='$value'>\n";
                        }
                        echo "<label class='form-check-label' for='$answerColumnName'> $answerText</label>\n";
                        echo "</section>";
                    }
                }
                ?>
                    <input type="hidden" name="questionNum" value="<?php echo $quiz["questionNum"];?>">
                    <input type="hidden" name="lastQuestionIndex" name="lastQuestionIndex" value="<?php echo $currentQuestionIndex;?>">
                    <input type="hidden" name="multipleChoice" name="multipleChoice" value="<?php echo $multipleChoice ? 'true' : 'false'; ?>">
                    <input type="hidden" id="maxPoints" name="maxPoints" value="">
                    <input type="hidden" name="indexStep" name="indexStep" value="1">

                <!-- Validation of question -->
                    <p id="validation-warning" class="warning"></p>

                    <button type="submit" class="btn btn-primary" style="">Next</button>
                    <p class="spacer"></p>

            </form>
        </section>
    </section>
</section>

<?php include "footer.php" ?>
<script src="../script.js"></script>

</body>
</html>