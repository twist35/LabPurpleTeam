<?php
    $page = isset($_GET['page']) ? $_GET['page'] : 'site.php';

    define('LENOX_ACCESS', true);

    include $page;

?>
