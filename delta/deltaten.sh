#!/bin/bash

# Verifica se è stato passato il comando "create:page"
if [ "$1" == "create:page" ]; then
    # Verifica se è stato passato il nome della pagina come parametro
    if [ -z "$2" ]; then
        echo "Errore: Nome della pagina mancante."
        echo "Utilizzo: deltaten create:page <nome_pagina>"
        exit 1
    fi

    # Esegui lo script bash con il nome della pagina come parametro
    ./delta/comands/addPage.sh "$2"
elif [ "$1" == "create:controller" ]; then
    # Verifica se è stato passato il nome della pagina come parametro
    if [ -z "$2" ]; then
        echo "Errore: Nome del controller mancante."
        echo "Utilizzo: deltaten create:controller <nome_controller>"
        exit 1
    fi

    # Esegui lo script bash con il nome della pagina come parametro
    ./delta/comands/addController.sh "$2"
else
    echo "Comando non supportato."
fi
