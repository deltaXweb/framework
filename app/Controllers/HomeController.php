<?php

class HomeController{
    public function index(){
        // Crea un'istanza della classe View
        view('home', ['name' => 'John', 'age' => 30]);

    }
}