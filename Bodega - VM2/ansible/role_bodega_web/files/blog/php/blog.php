<?php
session_start();
require 'db.php';

if (!isset($_SESSION['user_id'])) {
    header('Location: login.html');
    exit;
}

if ($_SERVER['REQUEST_METHOD'] === 'POST' && !empty($_POST['message'])) {
    $user_id = $_SESSION['user_id'];
    $content = trim($_POST['message']);
    $stmt = $pdo->prepare("INSERT INTO messages (user_id, content) VALUES (?, ?)");
    $stmt->execute([$user_id, $content]);
}

// Récupération admin
$stmtAdmin = $pdo->prepare("SELECT is_admin FROM users WHERE id = ?");
$stmtAdmin->execute([$_SESSION['user_id']]);
$userInfo = $stmtAdmin->fetch(PDO::FETCH_ASSOC);
$isAdmin = $userInfo && $userInfo['is_admin'];

$filter = $_GET['filter'] ?? '';
$sql = "
    SELECT m.content, m.created_at, u.username
    FROM messages m
    JOIN users u ON m.user_id = u.id
    WHERE m.content LIKE '%$filter%'
    ORDER BY m.created_at ASC
";
$messages = $pdo->query($sql)->fetchAll(PDO::FETCH_ASSOC);
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
        <form method="GET" action="">
            <input type="text" name="filter" placeholder="Filtrer les messages">
            <button type="submit">Filtrer</button>
        </form>
        <div class="messages">
            <h2>Messages :</h2>
            <?php foreach ($messages as $message): ?>
                <div class="message">
                    <p><strong><?= htmlspecialchars($message['username']) ?> :</strong> <?= htmlspecialchars($message['content']) ?></p>
                </div>
            <?php endforeach; ?>
        </div>

        <div class="formulaire">
            <form method="POST" action="">
                <textarea name="message" placeholder="Écrivez un message" required></textarea>
                <button type="submit">Envoyer</button>
            </form>
            <form method="POST" action="logout.php" onsubmit="return confirm('Voulez-vous vraiment vous déconnecter ?');">
                <button type="submit">Se déconnecter</button>
            </form>
        </div>
    </div>

    <?php if ($isAdmin): ?>
    <div class="admin-button-container">
        <form action="admin.php" method="get" style="display:inline;">
            <button type="submit">Admin Page</button>
        </form>
    </div>
    <?php endif; ?>

</body>
</html>
