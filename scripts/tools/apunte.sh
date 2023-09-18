#!/bin/bash
# apunte - @humbertowoody
# Crea un archivo con la fecha actual y lo abre en vim

function apunte() {
    # Obtener la fecha actual en formato AAAA-MM-DD
    local current_date=$(date "+%Y-%m-%d")

    # Obtener el nombre del archivo
    local filename="${current_date}.md"

    # Obtenemos un fortune corto para incrustarlo en el archivo
    local fortune=$(fortune -s)
    
    # Revisamos si existe el archivo
    if [[ ! -e $filename ]]; then
        # Si no existe, lo creamos con el siguiente contenido
        cat > "$filename" <<- EOF
# <!--- Materia - Tema -->

Clase del $current_date.

> $fortune

## Temas



## Tarea

- 

## Notas finales

- 

---
Humberto Alejandro Ortega Alcocer - $current_date
EOF
    fi
    
    # Abrimos el archivo en vim
    vim "$filename"
}

