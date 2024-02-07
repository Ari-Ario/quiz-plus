<?php
/*
    INCLUDE DATABASE CONNECTION
*/
include 'db.php';


$queryString = "SELECT * FROM questions";



/*
    DATEA
*/

$data = [];


/* function databankQuery($queryString){
    $queryString = $queryString;
} */

try{

    // überprüfe, ob Abfrage vorhanden ist
    if($queryString == ''){
        throw new \Exception('No querry written yet!');
    }

    // bereite die Abfrage vor
    $query = $dbConnection->prepare($queryString);

    // füge Daten für Platzhalter ein, falls vorhanden
    $query->execute($data);

    // überprüfe, ob Daten zurück gegeben werden
    if($query->rowCount() == 0) {
        throw new \Exception('Your query retrives no data!');
    }

    // alle Daten werden aus der DB geholt und in einem assoziativen Array gespeichert
    $questions = $query->fetchAll(PDO::FETCH_ASSOC);

    

} catch (PDOException $e) {
    die("Fehler: " . $e->getMessage());
}