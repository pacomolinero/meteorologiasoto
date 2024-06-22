#!/bin/bash
# Uso: ./aemetextract.sh [FECHA]
# FECHA es una fecha en formato ISO 8601
# Si no se especifica se usara la fecha actual

# Aborta mision si un comando falla
set -e 
set -o pipefail

FORMATO_FECHAS_API='+%Y-%m-%dT00%%3A00%%3A00UTC'
OUT_FILE=datos.json

# Parametros de la peticion
FECHA_FIN_API=$(date --date="$1" "$FORMATO_FECHAS_API")
FECHA_INI_API=$(date --date="$1 - 6 months" "$FORMATO_FECHAS_API")
ESTACION="3191E"
API_KEY="eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJwYWNyOGFjNjc3LTYwMmQtNDkzOS1iMDgyLWQ0MDA5ZDM1MWE5YiIsImlzcyI6IkFFTUVUIiwiaWF0IjoxNjA5NDkxNTIyLCJ1c2VySWQiOiIzMjhhYzY3Ny02MDJkLTQ5MzktYjA4Mi1kNDAwOWQzNTFhOWIiLCJyb2xlIjoiIn0.Ow5zuZbkr3-XTrLVPSfH9L2yDkEtuChdWZHVQ1Yenxc"

# Solicitud URL de datos via API
RESPUESTA=$( \
curl --fail \
 "https://opendata.aemet.es/opendata/api/valores/climatologicos/diarios/datos/fechaini/$FECHA_INI_API/fechafin/$FECHA_FIN_API/estacion/$ESTACION" \
 -H 'accept: application/json' \
 -H "api_key: $API_KEY" \
)

# Extraccion de URL de datos de la respuesta JSON
URL_DATOS=$(jq -r --argjson input "$RESPUESTA" -n '$input.datos')

# Descarga de los datos
wget -O "$OUT_FILE" "$URL_DATOS"
