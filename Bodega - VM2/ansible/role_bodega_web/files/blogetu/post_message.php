<?php
session_start();
require 'db.php';

// Vérification si l'utilisateur est connecté
if (!isset($_SESSION['user_id'])) {
    header('Location: login.php');
    exit;
}

// Ajouter le message dans la base de données
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $message = $_POST['message'];
    $user_id = $_SESSION['user_id'];

    $stmt = $pdo->prepare("INSERT INTO messages (user_id, content, created_at) VALUES (?, ?, NOW())");
    $stmt->execute([$user_id, $message]);

    header('Location: blog.php');
    exit;
}
?>
