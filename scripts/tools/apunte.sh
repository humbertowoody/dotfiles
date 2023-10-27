#!/bin/bash
# apunte - @humbertowoody
# Crea un archivo con la fecha actual y lo abre en vim (o en el editor especificado)
# Uso: apunte [tema] [editor]
# Ejemplo: apunte "Materia - Tema 1" code

function apunte() {
    # Obtener la fecha actual en español
    local current_date=$(LC_TIME=es_ES.UTF-8 date "+%A, %d de %B de %Y")

    # Obtener la fecha solo para el nombre del archivo
    local filename_date=$(date "+%d-%m-%Y")

    # Obtener el nombre del archivo con la fecha anterior
    local filename="${filename_date}.md"

    # Verificar si se proporcionó un tema o materia
    local title
    if [[ -n $1 ]]; then
        # Si se proporcionó un tema, lo usamos como título
        title="# $1"
    else
        # Si no se proporcionó un tema, dejamos una indicación
        title="# <!--- Materia - Tema -->"
    fi

    # Obtener el editor de texto si se proporciona, o usar vim por defecto
    local editor=${2:-vim}

    # Obtenemos un fortune corto y lo formateamos para markdown
    local fortune=$(fortune -s | sed 's/^/> /')

    # Revisamos si existe el archivo
    if [[ ! -e $filename ]]; then
        # Si no existe, lo creamos con el siguiente contenido
        cat > "$filename" <<- EOF
$title

Clase del $current_date.

$fortune

## Temas

-

## Tarea

## Notas finales

## Glosario

---

Humberto Alejandro Ortega Alcocer - $current_date

EOF
    fi

    # Abrimos el archivo en el editor especificado
    $editor "$filename"
}
