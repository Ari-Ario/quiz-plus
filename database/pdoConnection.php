<?php




$dbName = getenv('DB_NAME');
$dbUser = getenv('DB_USER');
$dbPassword = getenv('DB_PASSWORD');
$dbHost = getenv('DB_HOST');

try {
    // Create a connection to the database
    $dbConn = new PDO("mysql:host=$dbHost;dbname=$dbName;charset=utf8", $dbUser, $dbPassword);
    $dbConn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    // $dbConn->setAttribute(PDO::ATTR_CASE, PDO::CASE_UPPER);
    // echo "connection succesful";
} catch (PDOException $e) {
    die("Connection Error: " . $e->getMessage()); // display error message
}


$query = "CREATE TABLE IF NOT EXISTS users (id INT AUTO_INCREMENT PRIMARY KEY, name VARCHAR (255),password VARCHAR (255),email VARCHAR (255))";

$query = "INSERT INTO users (name,password) VALUES (:user,:pass)";
$query = "UPDATE users SET password= :pass where name=:user";

//pasword for smith "Avdc12/sd"
$password = "Avdc12/sd";
//password for melke and tesfay "Avdc12$sd" 
$password = 'Avdc12$sd';
$password = password_hash($password, PASSWORD_DEFAULT);

$arr = ['user' => 'tesfay', 'pass' => $password];
// $queryR = $dbConn->prepare($query);

// $queryR->execute($arr);







// try {
//     // Select question 14 and the correct answer
//     $sqlCreatePageTable = "SELECT Q.question, A.answer
//     FROM questions AS Q, answers AS A
//     WHERE Q.id=14 AND (A.question_id=14 AND A.is_correct =1)";

//     //Slecet multiple questions and their corresponding answers
//     $sqlCreatePageTable = "SELECT Q.question, A.answer
//     FROM questions AS Q, answers AS A
//     WHERE Q.id IN(2,4,6,8,10) AND A.question_id=Q.id  AND A.is_correct=1";


//     // Select multiple questions and their corresponding answers with INNER JOIN
//     $sqlCreatePageTable = "SELECT * FROM questions INNER JOIN answers ON questions.id = answers.question_id WHERE answers.is_correct=1";

//     // Select multiple questions and their corresponding answers with RIGHT JOIN

//     $sqlCreatePageTable = "SELECT question ,answers.answer FROM questions INNER JOIN answers ON questions.id = answers.question_id";




//     $result = $dbConn->prepare($sqlCreatePageTable);

//     // exec führt das SQL statment oben aus.
//     $result->execute();


//     $resultfinl = $result->fetchAll(PDO::FETCH_ASSOC);
// } catch (PDOException $e) {

//     echo $e->getMessage();
// }
