<?php
include dirname(__DIR__) . "/utils/helper.php";
// Connection credentials for the database
// You can find the credentials in docker-compose.yml
$dbName = getenv('DB_NAME');
$dbUser = getenv('DB_USER');
$dbPassword = getenv('DB_PASSWORD');
$dbHost = getenv('DB_HOST');

try {
    // Create a connection to the database
    $dbConnection = new PDO("mysql:host=$dbHost;dbname=$dbName;charset=utf8", $dbUser, $dbPassword);
    $dbConnection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("Connection Error: " . $e->getMessage()); // display error message
}

// Query functions

function fetchQuestionIdSequence($topic, $questionNum, $dbConnection)
{
    $query = "SELECT `id` FROM `question` WHERE `topic` = '$topic' ORDER BY RAND() LIMIT $questionNum";
    // all data with 
    $sqlStatement = $dbConnection->query($query);
    $rows = $sqlStatement->fetchAll(PDO::FETCH_COLUMN, 0);
    return $rows;
}

function questionRequest($id, $dbConnection)
{
    // all data with id
    $query = "SELECT * FROM `question` INNER JOIN `answer` ON question.id = answer.question_id
    WHERE answer.question_id = $id
    ORDER BY question.id, RAND(answer.id)";
    $sqlStatement = $dbConnection->query($query);
    $rows = $sqlStatement->fetchAll(PDO::FETCH_ASSOC);
    return $rows;
}


// function to take all data from a table as an Array; here from questions
function takeFromTable($dbConnection)
{
    $querySelect = "SELECT * FROM `questions`";
    // all data with 
    $sqlStatement = $dbConnection->query($querySelect);
    $rows = $sqlStatement->fetchAll(PDO::FETCH_ASSOC);
    return $rows;
}


function addStatistic($topic, $procent, $dbConnection)
{
    //first: create a table with columns: `statistic`(`topic_id`, `topic`, `repeated`, `procent`)

    $query = "SHOW TABLES LIKE 'statistic'";
    $sqlStatement = $dbConnection->prepare($query);
    $sqlStatement->execute();
    $fetchSth = $sqlStatement->fetchColumn();

    // if the table does not exist
    if (!$fetchSth) {
        // create table 
        $queryCreate = "CREATE TABLE `statistic` (
            topic_id INT(6) AUTO_INCREMENT,
            topic VARCHAR(30) NOT NULL,
            repeated VARCHAR(30) NOT NULL,
            procent VARCHAR(50) NOT NULL,
            PRIMARY KEY (topic_id)
            )";
        $addStatement = $dbConnection->query($queryCreate);

        $queryInsertNew = "INSERT INTO statistic (`topic`, `repeated`, `procent`) VALUES ('$topic', 1, $procent)";
        $statmentInsert = $dbConnection->query($queryInsertNew);
    } else { // if the table existes but:
        $query = "SELECT * FROM statistic WHERE topic = '$topic'";
        $sqlStatement = $dbConnection->prepare($query);
        $sqlStatement->execute();
        $row = $sqlStatement->fetch(PDO::FETCH_ASSOC);
        // the row with the selected topic does not exist
        if (!$row) {
            $queryInsertNew = "INSERT INTO statistic (`topic`, `repeated`, `procent`) VALUES ('$topic', 1, $procent)";
            $dbConnection->query($queryInsertNew);
        } else { // finally if the table and the row exists, then just update it
            $query = "SELECT * FROM statistic WHERE topic = '$topic'";
            $sqlStatement = $dbConnection->query($query);
            $row = $sqlStatement->fetch(PDO::FETCH_ASSOC);

            $repeated = $row['repeated'] + 1;
            $percentage = $row['procent'] + $procent;
            $addRow = "UPDATE `statistic`
            SET `repeated` = $repeated, `procent` = $percentage
            WHERE `topic` = '$topic'";
            $addStatement = $dbConnection->query($addRow);
        }
    }
}

// To avoid exploits and JS Injections
function test_input($data)
{
    $data = trim($data);
    $data = stripslashes($data);
    $data = htmlspecialchars($data);
    return $data;
}
if ($_POST['email']) {
    newsletter($dbConnection);
}



function newsletter($dbConnection)
{
    //first: create a table with columns: `newsletter`(`id`, `user_name`, `email`)
    $name = test_input($_POST["name"]);
    $email = test_input($_POST["email"]);

    global $emailErr;

    $query = "SHOW TABLES LIKE 'newsletter'";
    $sqlStatement = $dbConnection->prepare($query);
    $sqlStatement->execute();
    $fetchSth = $sqlStatement->fetchColumn();

    // if the table does not exist
    if (!$fetchSth) {
        // create table 
        $queryCreate = "CREATE TABLE `newsletter` (
            id INT AUTO_INCREMENT,
            user_name VARCHAR(255) NOT NULL,
            email VARCHAR(255) NOT NULL,
            PRIMARY KEY (id)
            )";
        $dbConnection->query($queryCreate);
        // inserting the query with the creation of the table simultainously
        $queryInsertNew = "INSERT INTO newsletter (`user_name`, `email`) VALUES ('$name', '$email')";
        $dbConnection->query($queryInsertNew);
        $emailErr = "Your email has been registered successfully!";
    } else { // if the table existes but:
        $query = "SELECT * FROM newsletter WHERE email = '$email'";
        $sqlStatement = $dbConnection->prepare($query);
        $sqlStatement->execute();
        $row = $sqlStatement->fetch(PDO::FETCH_ASSOC);
        // the row with the selected topic does not exist
        if (!$row) {
            $queryInsertNew = "INSERT INTO newsletter (`user_name`, `email`) VALUES ('$name', '$email')";
            $dbConnection->query($queryInsertNew);

            $emailErr = "Your email has been registered successfully!";
        } else { // finally if the table and the row exists, then just update it

            $emailErr = "Email already exists!";
        }
    }
}

$emailErr;

//  extra functions to split the table questions into two other tables: question and answer
// a function to check if a row is recorded once; it takes data from createROW
function recordOnce($answer, $dbConnection)
{
    $addRow = "SELECT COUNT(*) FROM answer WHERE answer = :answer";
    $statment = $dbConnection->prepare($addRow);
    $statment->bindParam(':answer', $answer);
    $statment->execute();
    $fetchTest = $statment->fetchColumn();
    if ($fetchTest > 0) {
        echo ' <br>';
        echo "There is already a title with name {$answer}";
        echo ' <br>';
        return true;
    } else {
        echo ' <br>';
        echo "One line checkin;";
        echo ' <br>';
        return false;
    }
}

// function to insert new data to a table according to the query; here insert into answers
function insertIntoTable($answer, $correctAnswer, $questionId, $dbConnection)
{

    try {
        // in fall of a duplications, which are not needed, we may need some duplications
        /* if (recordOnce($answer, $dbConnection)){
            return;
        } */
        $queryInsert = "INSERT INTO `answer`(`answer`, `is_correct`, `question_id`) VALUES ('$answer', $correctAnswer, $questionId)";
        // all data with 
        $sqlStatement = $dbConnection->query($queryInsert);
        // ->query is equivalant to both ->prepare and ->execute, therefore use either ->query or the other two
        // $sqlStatement->execute();
        echo "<p>insertIntoTable: $answer successful</p>";
        // echo "The ROW was created successfully!";
        echo ' <br>';
    } catch (PDOException $e) {
        echo $e->getMessage();
    }
}
