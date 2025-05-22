<?php
    // Cockpit credentials
    $username = "webadmin";
    $password = "k6Ms94tK062OvDH";

    if (!defined('LENOX_ACCESS')) {
        http_response_code(403);
        exit('Direct access not permitted');
    }

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lenox</title>
    <!-- Flowbite CSS -->
    <link href="https://cdn.jsdelivr.net/npm/flowbite@2.5.2/dist/flowbite.min.css" rel="stylesheet" />
</head>
<body class="bg-gray-100 dark:bg-gray-800">

<!-- Navigation Bar -->
<nav class="bg-white border-gray-200 dark:bg-gray-900">
    <div class="flex flex-wrap justify-between items-center mx-auto max-w-screen-xl p-4">
        <a href="http://localhost:8080/php/user/index.php" class="flex items-center space-x-3 rtl:space-x-reverse">
            <span class="self-center text-2xl font-semibold whitespace-nowrap dark:text-white">Lenox Pub</span>
        </a>
        <div class="flex items-center space-x-6 rtl:space-x-reverse"></div>
    </div>
</nav>

<!-- Maintenance Message -->
<div class="flex items-center justify-center h-screen">
    <div class="text-center">
        <h1 class="text-5xl font-extrabold text-gray-900 dark:text-white mb-4">Admin Page Under Construction</h1>
        <p class="text-lg text-gray-600 dark:text-gray-400">We're working on something great. This section isn't ready yet, but it will be soon!</p>
    </div>
</div>

<!-- Footer -->
<footer class="fixed bottom-0 left-0 z-20 w-full p-4 bg-white border-t border-gray-200 shadow md:flex md:items-center md:justify-between md:p-6 dark:bg-gray-800 dark:border-gray-600">
    <span class="text-sm text-gray-500 sm:text-center dark:text-gray-400">© 2025 Lenox. All Rights Reserved.</span>
</footer>

<!-- Flowbite JS -->
<script src="https://cdn.jsdelivr.net/npm/flowbite@2.5.2/dist/flowbite.min.js"></script>
</body>
</html>
