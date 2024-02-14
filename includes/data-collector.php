<?php
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}
// if (isset($_SESSION['topic'])) {$_SESSION['topic'] = $_POST['topic'];}
include "db.php";
// $topic = $_POST['topic'];

if (isset($_SESSION['quiz'])) $quiz = $_SESSION['quiz'];
else $quiz = null;

if (isset($_POST["lastQuestionIndex"])) {
    $lastQuestionIndex = intval($_POST["lastQuestionIndex"]);

    if ($lastQuestionIndex >= 0) {
        $questionName = "question-" . $lastQuestionIndex;
        $_SESSION[$questionName] = $_POST;
    }
}    
else {
    $lastQuestionIndex = -1;
}
// the name of the sites is saved inside global variable:
$scriptName = $_SERVER['SCRIPT_NAME'];

if (str_contains($scriptName, 'index')){
    session_unset();
    $quiz = null;
}
else if (str_contains($scriptName, 'question')){
    if ($quiz === null){
        $questionNum = intval($_POST['questionNum']);
        $questionIdSequence = fetchQuestionIdSequence($_POST['topic'], $questionNum, $dbConnection);
        // prettyPrint($questionIdSequence);
        // exit();
        
        // break the code if the number of questions more than the selected numbers are -- TODO Warning in index

        $questionNum = count($questionIdSequence);

        // collecting the data 
        $quiz = array(
            "topic" => $_POST['topic'],
            "questionNum" => $questionNum,
            "lastQuestionIndex" => $lastQuestionIndex,
            "currentQuestionIndex" => -1,
            "questionIdSequence" => $questionIdSequence
        );
        $_SESSION['quiz'] = $quiz;

    }
    // repeat the form, in case of finished number of questions redirect it to report 
    $currentQuestionIndex= $lastQuestionIndex+1;
    if ( $currentQuestionIndex < $quiz['questionNum']-1){
        $actionUrl = "question.php";
        
    }
    else {

        $actionUrl = "report.php";

    }
}
else if (str_contains($scriptName, 'reoprt')){
    $currentQuestionIndex = -1;
}

