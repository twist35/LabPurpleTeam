<?php
session_start();
require 'db.php';

// Vérification si utilisateur connecté
if (!isset($_SESSION['user_id'])) {
    header('Location: login.html');
    exit;
}

// Vérifier que le message existe et n'est pas vide
if (!empty($_POST['message'])) {
    $user_id = $_SESSION['user_id'];
    $content = trim($_POST['message']);

    // Préparer et exécuter l'insertion du message
    $stmt = $pdo->prepare("INSERT INTO messages (user_id, content) VALUES (?, ?)");
    $stmt->execute([$user_id, $content]);
}

// Rediriger vers la page du blog pour voir le message affiché
header('Location: blog.php');
exit;