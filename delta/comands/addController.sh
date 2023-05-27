#!/bin/bash

# Verifica se è stato passato il parametro del nome del controller
if [ -z "$1" ]; then
  echo "Errore: Nome del controller mancante."
  echo "Utilizzo: ./crea_controller.sh <nome_controller>"
  exit 1
fi

controller_name=$1

# Aggiunge il controller nella cartella "app\Controllers\"
controller_file="app\Controllers\\${controller_name}Controller.php"
touch "$controller_file"

# Aggiunge il contenuto base del controller
echo -e "<?php\n\nclass ${controller_name}Controller\n{\n    public function index()\n    {\n        // Implementa la logica dell'azione index\n    }\n}" > "$controller_file"
echo "Controller '${controller_name}Controller' creato con successo."