#!/bin/bash

# Richiesta del nome della cartella
read -p "Inserisci il nome della cartella di progetto: " folder_name

# Controllo se la cartella esiste già
if [ -d "$folder_name" ]; then
    echo "La cartella $folder_name esiste già."
    exit 1
fi

# Clonare la repository
git clone https://github.com/deltaXweb/framework.git "$folder_name"

# Verificare se il clone è avvenuto con successo
if [ $? -eq 0 ]; then
    echo "Progetto creato con successo nella cartella $folder_name."
else
    echo "Si è verificato un errore durante la configurazione."
    exit 1
fi

# Richiesta del nome e della scelta del framework
read -p "Scegli il framework (bootstrap/tailwind): " framework_choice

# Creazione del file JSON
json="{\"MAIN\": {\"NAME\": \"$folder_name\", \"LOGO\": \"\", \"FAVICON\": \"favicon\", \"FRAMEWORK\": \"$framework_choice\"}}"

# Crea un file JSON e scrivi l'oggetto JSON
echo "$json" > "$folder_name/config.json"

rm "$folder_name/config.sh"

echo "Configurazione completata con successo."

