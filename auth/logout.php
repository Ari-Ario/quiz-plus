<?php
if (session_status() === PHP_SESSION_NONE) {
    // Starte die Session
    session_start();
}

unset($_SESSION['username']);
// session_destroy();

header("location: ../index.php");
