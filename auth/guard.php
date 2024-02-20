<?php
if (session_status() === PHP_SESSION_NONE) {
    // Starte die Session
    session_start();
}

if (!isset($_SESSION['username'])) {
    session_unset();
    session_destroy();
    header('Location: ../index.php');
}
