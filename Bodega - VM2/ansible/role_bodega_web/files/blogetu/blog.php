<?php
session_start();
require 'db.php';

// Vérification si l'utilisateur est connecté
if (!isset($_SESSION['user_id'])) {
    header('Location: login.php');
    exit;
}

// Récupérer les messages
$stmt = $pdo->query("SELECT * FROM messages ORDER BY created_at DESC");
$messages = $stmt->fetchAll();
?>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Blog - Blogetu</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>

    <h1>Bienvenue sur le blog de Blogetu</h1>
    
    <?php if ($_SESSION['is_admin'] == 1): ?>
        <h3>Page Admin (visible seulement pour les admins)</h3>
        <p>Bienvenue Admin ! Vous pouvez gérer les messages ici.</p>
    <?php endif; ?>
    
    <h2>Messages :</h2>
    <?php foreach ($messages as $message): ?>
        <div>
            <p><strong><?= htmlspecialchars($message['username']) ?> :</strong> <?= htmlspecialchars($message['content']) ?></p>
        </div>
    <?php endforeach; ?>

    <form method="POST" action="post_message.php">
        <textarea name="message" placeholder="Écrivez un message" required></textarea><br>
        <button type="submit">Envoyer</button>
    </form>

    <a href="logout.php">Se déconnecter</a>
    
</body>
</html>
