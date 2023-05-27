<?php
require 'config/ControllerAutolad.php';
require 'configuration/Route.php';


// Esempio di rotta per la pagina principale
$routeHome = new Route('/', 'HomeController@index');

// Esempio di rotta con parametro dinamico
$routeUser = new Route('/user/{id}', function ($id) {
    echo "Visualizzazione utente con ID: " . $id;
});

// Esempio di rotta non trovata
$routeNotFound = new Route('', function () {
    echo "Pagina non trovata";
});

// Esempio di routing
$requestedUrl = $_SERVER['REQUEST_URI'];

if ($routeHome->match($requestedUrl)) {
    $routeHome->call();
} elseif ($routeUser->match($requestedUrl)) {
    $routeUser->call();
} else {
    $routeNotFound->call();
}
