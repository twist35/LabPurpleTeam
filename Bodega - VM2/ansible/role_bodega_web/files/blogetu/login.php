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

    // Vérification des informations de connexion
    $stmt = $pdo->prepare("SELECT * FROM users WHERE username = :username LIMIT 1");
    $stmt->execute(['username' => $username]);
    $user = $stmt->fetch();

    if ($user && password_verify($password, $user['password_hash'])) {
        $_SESSION['user_id'] = $user['id'];
        $_SESSION['username'] = $user['username'];
        $_SESSION['is_admin'] = $user['is_admin'];
        header('Location: blog.php');
        exit;
    } else {
        $error = 'Identifiants incorrects';
    }
}
?>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Blogetu</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>

    <h1>Login</h1>
    
    <?php if (isset($error)): ?>
        <p style="color:red;"><?= htmlspecialchars($error) ?></p>
    <?php endif; ?>
    
    <form method="POST">
        <label for="username">Nom d'utilisateur :</label><br>
        <input type="text" name="username" id="username" required><br>
        
        <label for="password">Mot de passe :</label><br>
        <input type="password" name="password" id="password" required><br>
        
        <button type="submit">Se connecter</button>
    </form>

</body>
</html>
