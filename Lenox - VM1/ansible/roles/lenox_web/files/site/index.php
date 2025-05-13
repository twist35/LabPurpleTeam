<?php
    $page = isset($_GET['page']) ? $_GET['page'] : 'site.php';

    $allowed_pages = ['site.php', 'admin.php'];

    define('LENOX_ACCESS', true);

    if (in_array($page, $allowed_pages)) {
        include 'includes/' . $page;
    } else {
        echo "404 Page not found";
    }
?>
