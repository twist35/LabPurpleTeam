<?php
session_start();
require 'db.php';

// Vérification si l'utilisateur est connecté
if (!isset($_SESSION['user_id'])) {
    header('Location: login.html');
    exit;
}

// Récupération des messages avec le nom d'utilisateur via jointure
$stmt = $pdo->prepare("
    SELECT m.content, m.created_at, u.username 
    FROM messages m
    JOIN users u ON m.user_id = u.id
    ORDER BY m.created_at ASC
");
$stmt->execute();
$messages = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Blog - Blogetu</title>
    <link rel="stylesheet" href="styles2.css">
</head>
<body>

    <h1>Bienvenue sur le blog de Blogetu</h1>

    <div class="container">
        <div class="messages">
            <h2>Messages :</h2>
            <?php foreach ($messages as $message): ?>
                <div class="message">
                    <p><strong><?= htmlspecialchars($message['username']) ?> :</strong> <?= $message['content'] ?></p>
                </div>
            <?php endforeach; ?>
        </div>

        <div class="formulaire">
            <form method="POST" action="post_message.php">
                <textarea name="message" placeholder="Écrivez un message" required></textarea>
                <button type="submit">Envoyer</button>
            </form>
            <a href="logout.php">Se déconnecter</a>
        </div>
    </div>

</body>
</html>
