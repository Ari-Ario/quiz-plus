<?php
include "db.php";

$rows = takeFromTable($dbConnection);

prettyPrint($rows);

foreach ($rows as $key => $data) {
    for ($i = 1; $i <= 5; $i++){

        if (empty($data["answer_$i"])) {
            continue;
        } else if (isset($data["answer_$i"]) && !empty($data["answer_$i"])) {
            $answer = $data["answer_$i"];
            $questionId = $data["id"];
            if (str_contains($data['correct'], "$i")){
                $correctAnswer = '1';
            } else {
                $correctAnswer = '0';
            }
        }
        echo "$answer, $correctAnswer, $questionId <br>";
        insertIntoTable($answer, $correctAnswer, $questionId, $dbConnection);
    }
    echo "--------------------------------------------- <br>";
}