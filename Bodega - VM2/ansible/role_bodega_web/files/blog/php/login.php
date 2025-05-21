<?php
session_start();
require 'db.php';

// Si l'utilisateur est déjà connecté, le rediriger vers la page de blog
if (isset($_SESSION['user_id'])) {
    header('Location: blog.php');
    exit;
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $username = $_POST['username'];
    $password = $_POST['password'];

    $stmt = $pdo->prepare("SELECT * FROM users WHERE username = :username LIMIT 1");
    $stmt->execute(['username' => $username]);
    $user = $stmt->fetch();

    if ($user && md5($password) === $user['password_hash']) {
        $_SESSION['user_id'] = $user['id'];
        $_SESSION['username'] = $user['username'];
        $_SESSION['is_admin'] = $user['is_admin'];
        header('Location: blog.php');
        exit;
    } else {
        header('Location: login.html?error=1');
        exit;
    }
}

http_response_code(405); 
echo "Méthode non autorisée.";
exit;
