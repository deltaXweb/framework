#!/bin/bash

# Verifica se è stato passato il parametro del nome del controller
if [ -z "$1" ]; then
  echo "Errore: Nome della vista mancante."
  echo "Utilizzo: ./crea_controller.sh <nome_controller>"
  exit 1
fi

page_name=$1

# Crea un file vista nella cartella "resources\pages"
view_file="resources\pages\\${page_name}.php"
touch "$page_name"
echo "<div id="pagename" data-title="${page_name}"></div>\n<div class="container">\n prova \n</div>" >> "resources\pages\\${page_name}.php"
echo "File vista '${page_name}.php' creato con successo nella cartella 'resources\pages'."
