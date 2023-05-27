<?php
spl_autoload_register(function ($className) {
    // Specifica il percorso della directory dei controller
    $controllerPath = 'app/Controllers/';

    // Converti il nome della classe nel percorso del file
    $filePath = $controllerPath . $className . '.php';

    // Verifica se il file del controller esiste e includilo
    if (file_exists($filePath)) {
        require_once $filePath;
    }
});