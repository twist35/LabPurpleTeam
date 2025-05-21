<?php
session_start();
require_once 'db.php';

if (!isset($_SESSION['user_id'])) {
    header('Location: login.html');
    exit();
}

$stmt = $pdo->prepare("SELECT is_admin FROM users WHERE id = ?");
$stmt->execute([$_SESSION['user_id']]);
$user = $stmt->fetch(PDO::FETCH_ASSOC);

if (!$user || !$user['is_admin']) {
    die("Accès refusé : vous n'êtes pas administrateur.");
}

$message = "";
$exec_output = [];

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['backup_name']) && isset($_POST['mdp'])) {
    $backup_name = trim($_POST['backup_name']);
    if ($backup_name === '') {
        $backup_name = "site_backup.zip";
    }

    $safe_backup_name = escapeshellarg($backup_name);

    $mdp = trim($_POST['mdp']);

    $cmd = "zip -r -P $mdp $safe_backup_name . 2>&1";

    exec($cmd, $exec_output, $ret);

    if ($ret === 0 && file_exists($backup_name)) {
        $message = "Backup créé avec succès : <a href=\"" . htmlspecialchars($backup_name) . "\">Télécharger " . htmlspecialchars($backup_name) . "</a>";
    } else {
        $message = "Erreur lors de la création du backup.";
    }
}
?>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Admin - Backup</title>
    <link rel="stylesheet" href="styles2.css">
</head>
<body>
    <h1>Page d'administration</h1>
    <div class="accueil-container">
        <form method="POST" action="admin.php">
            <label for="backup_name">Nom du fichier :</label><br>
            <input type="text" name="backup_name" id="backup_name" placeholder="backup.zip"><br><br>

            <label for="mdp">Mot de passe de l'archive :</label><br>
            <input type="text" name="mdp" id="mdp" placeholder="Mot de passe"><br><br>

            <input type="submit" value="Créer le backup">
        </form>
    </div>

    <p><?php echo $message; ?></p>

    <?php if (!empty($exec_output)): ?>
        <pre><?php echo htmlspecialchars(implode("\n", $exec_output)); ?></pre>
    <?php endif; ?>
</body>
</html>
