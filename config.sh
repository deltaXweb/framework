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
read -p "Inserisci il nome del progetto: " project_name
read -p "Scegli il framework (boostrap/tailwind): " framework_choice

# Crea un oggetto JSON con i dati inseriti
json=$(jq -n --arg project_name "$project_name" --arg framework_choice "$framework_choice" '{MAIN: {"NAME": $project_name, "LOGO":"","FAVICON":"favicon", "FRAMEWORK": $framework_choice}}')

# Crea un file JSON e scrivi l'oggetto JSON
echo "$json" > "$folder_name/config.json"

echo "Configurazione completata con successo."

