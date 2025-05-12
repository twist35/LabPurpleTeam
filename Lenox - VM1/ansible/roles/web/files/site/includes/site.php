<?php
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
        <a href="#" class="flex items-center space-x-3 rtl:space-x-reverse">
            <span class="self-center text-2xl font-semibold whitespace-nowrap dark:text-white">Lenox Pub</span>
        </a>
        <div class="flex items-center space-x-6 rtl:space-x-reverse"></div>
    </div>
</nav>

<h1 class="w-1/2 mx-auto mt-5 text-center mb-2 text-4xl font-bold tracking-tight text-gray-900 dark:text-white">Our products</h1>
<div class="grid grid-cols-2 gap-6 w-1/2 mx-auto mt-5 pb-16 mb-5">
    <div class="mx-auto max-w-sm bg-white border border-gray-200 rounded-lg shadow dark:bg-gray-800 dark:border-gray-700">
        <a href="#">
            <img class="rounded-t-lg h-48 mt-2 mx-auto" src="images/beer.jpeg" alt="" />
        </a>
        <div class="p-5">
            <a href="#">
                <h5 class="mb-2 text-2xl font-bold tracking-tight text-gray-900 dark:text-white">Beer</h5>
            </a>
            <p class="mb-3 font-normal text-gray-700 dark:text-gray-400">Come explore our wide selection of craft and classic beers — there’s a perfect pint waiting for you.</p>
        </div>
    </div>

    <div class="mx-auto max-w-sm bg-white border border-gray-200 rounded-lg shadow dark:bg-gray-800 dark:border-gray-700">
        <a href="#">
            <img class="rounded-t-lg h-48 mt-2 mx-auto" src="images/cocktail.jpeg" alt="" />
        </a>
        <div class="p-5">
            <a href="#">
                <h5 class="mb-2 text-2xl font-bold tracking-tight text-gray-900 dark:text-white">Cocktail</h5>
            </a>
            <p class="mb-3 font-normal text-gray-700 dark:text-gray-400">Discover unique and refreshing cocktails, crafted with passion by our expert mixologists.</p>
        </div>
    </div>

    <div class="mx-auto max-w-sm bg-white border border-gray-200 rounded-lg shadow dark:bg-gray-800 dark:border-gray-700">
        <a href="#">
            <img class="rounded-t-lg h-48 mt-2 mx-auto" src="images/spirits.jpeg" alt="" />
        </a>
        <div class="p-5">
            <a href="#">
                <h5 class="mb-2 text-2xl font-bold tracking-tight text-gray-900 dark:text-white">Spirits</h5>
            </a>
            <p class="mb-3 font-normal text-gray-700 dark:text-gray-400">From smooth whiskies to bold rums, taste the finest spirits curated from around the world.</p>
        </div>
    </div>

    <div class="mx-auto max-w-sm bg-white border border-gray-200 rounded-lg shadow dark:bg-gray-800 dark:border-gray-700">
        <a href="#">
            <img class="rounded-t-lg h-48 mt-2 mx-auto" src="images/wine.jpeg" alt="" />
        </a>
        <div class="p-5">
            <a href="#">
                <h5 class="mb-2 text-2xl font-bold tracking-tight text-gray-900 dark:text-white">Wine</h5>
            </a>
            <p class="mb-3 font-normal text-gray-700 dark:text-gray-400">Whether red, white, or rosé — let our handpicked wines elevate every moment.</p>
        </div>
    </div>

    <div class="col-span-2 text-center dark:bg-gray-800 dark:border-gray-700">
        <div class="p-5">
            <a href="#">
                <h5 class="mb-2 text-2xl font-bold tracking-tight text-gray-900 dark:text-white">Informations</h5>
            </a>
            <p class="mb-3 font-normal text-gray-700 dark:text-gray-400">Come visit us at 42 Oaklane Street, Westborough, and enjoy a cozy atmosphere with great drinks and even better company. We’re waiting for you!</p>
        </div>
    </div>
</div>


<footer class="fixed bottom-0 left-0 z-20 w-full p-4 bg-white border-t border-gray-200 shadow md:flex md:items-center md:justify-between md:p-6 dark:bg-gray-800 dark:border-gray-600">
    <span class="text-sm text-gray-500 sm:text-center dark:text-gray-400">© 2025 Lenox. All Rights Reserved.
    </span>
</footer>

<!-- Flowbite JS -->
<script src="https://cdn.jsdelivr.net/npm/flowbite@2.5.2/dist/flowbite.min.js"></script>
</body>
</html>

