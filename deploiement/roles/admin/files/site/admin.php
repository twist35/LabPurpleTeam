<?php
session_start();

if (!isset($_SESSION['logged_in']) || $_SESSION['logged_in'] !== true) {
    header('Location: login.php');
    exit();
}

$uploadMessage = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_FILES['pdf_file'])) {
    $uploadDir = '/var/www/html/upload/';
    $fileName = basename($_FILES['pdf_file']['name']);
    $targetFile = $uploadDir . $fileName;

    if (stripos($fileName, '.pdf') !== false) {
        if (move_uploaded_file($_FILES['pdf_file']['tmp_name'], $targetFile)) {
            $uploadMessage = "You can now see your bill in upload/" . htmlspecialchars($fileName);
        } else {
            $uploadMessage = "Failed to upload file.";
        }
    } else {
        $uploadMessage = "Only files containing .pdf are allowed.";
    }
}
?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lenox</title>
    <link href="https://cdn.jsdelivr.net/npm/flowbite@2.5.2/dist/flowbite.min.css" rel="stylesheet" />
</head>
<body class="bg-gray-100 dark:bg-gray-800">
<nav class="bg-white border-gray-200 dark:bg-gray-900">
    <div class="flex flex-wrap justify-center items-center mx-auto max-w-screen-xl p-4">
        <a href="index.php" class="flex items-center space-x-3 rtl:space-x-reverse">
            <span class="self-center text-4xl font-bold whitespace-nowrap dark:text-white">Lenox Pub - Admin Page</span>
        </a>
    </div>
</nav>

<h1 class="w-1/2 mx-auto mt-5 text-center mb-2 text-2xl font-semibold tracking-tight text-gray-900 dark:text-white">Admin Page</h1>

<?php if ($uploadMessage): ?>
    <div class="w-96 mx-auto mb-4 text-dark-600 font-medium text-center">
        <?= htmlspecialchars($uploadMessage) ?>
    </div>
<?php endif; ?>

<form method="POST" enctype="multipart/form-data" class="w-1/2 mx-auto">
    <label class="block mb-2 text-sm font-medium text-gray-900 dark:text-white" for="file_input">Upload invoice</label>
    <input class="block w-full text-sm text-gray-900 border border-gray-300 rounded-lg cursor-pointer bg-gray-50 dark:text-gray-400 focus:outline-none dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400" id="file_input" type="file" required name="pdf_file">
    <button type="submit" class="mt-4 w-24 text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm w-full px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">Submit</button>
</form>

<footer class="fixed bottom-0 left-0 z-20 w-full p-4 bg-white border-t border-gray-200 shadow dark:bg-gray-800 dark:border-gray-600">
    <span class="text-sm text-gray-500 sm:text-center dark:text-gray-400">© 2025 Lenox. All Rights Reserved.</span>
</footer>

<script src="https://cdn.jsdelivr.net/npm/flowbite@2.5.2/dist/flowbite.min.js"></script>
</body>
</html>

