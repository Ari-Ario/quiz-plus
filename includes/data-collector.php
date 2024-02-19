<?php
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}
// if (isset($_SESSION['topic'])) {$_SESSION['topic'] = $_GET['topic'];}
include "db.php";
// $topic = $_GET['topic'];

if (isset($_SESSION['quiz'])) $quiz = $_SESSION['quiz'];
else $quiz = null;

if (isset($_GET["lastQuestionIndex"])) {
    $lastQuestionIndex = intval($_GET["lastQuestionIndex"]);

    if ($lastQuestionIndex >= 0) {
        $questionName = "question-" . $lastQuestionIndex;
        $_SESSION[$questionName] = $_GET;
    }
} else {
    $lastQuestionIndex = -1;
}
// the name of the sites is saved inside global variable:
$scriptName = $_SERVER['SCRIPT_NAME'];

if (str_contains($scriptName, 'index')) {
    session_destroy();
    session_unset();
    $quiz = null;
} else if (str_contains($scriptName, 'question')) {
    if ($quiz === null) {
        $questionNum = intval($_GET['questionNum']);
        $questionIdSequence = fetchQuestionIdSequence($_GET['topic'], $questionNum, $dbConnection);
        // prettyPrint($questionIdSequence);
        // exit();

        // break the code if the number of questions more than the selected numbers are -- TODO Warning in index

        $questionNum = count($questionIdSequence);

        // collecting the data 
        $quiz = array(
            "topic" => $_GET['topic'],
            "questionNum" => $questionNum,
            "lastQuestionIndex" => $lastQuestionIndex,
            "currentQuestionIndex" => -1,
            "questionIdSequence" => $questionIdSequence
        );
        $_SESSION['quiz'] = $quiz;
    }
    // repeat the form, in case of finished number of questions redirect it to report 
    $currentQuestionIndex = $lastQuestionIndex + 1;
    if ($currentQuestionIndex >= $quiz['questionNum'] - 1) {
        $actionUrl = "report.php";
    } else {
        $actionUrl = "question.php";
    }
} else if (str_contains($scriptName, 'reoprt')) {
    // $currentQuestionIndex = -1;
}
