#!/bin/bash

#ini=2020-12-27T00%3A00%3A00UTC
#fin=2020-12-31T00%3A00%3A00UTC

curl -X 'GET' \
  'https://opendata.aemet.es/opendata/api/valores/climatologicos/diarios/datos/fechaini/2024-06-01T00%3A00%3A00UTC/fechafin/2024-11-31T00%3A00%3A00UTC/estacion/3191E' \
  -H 'accept: application/json' \
  -H 'api_key: eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJwYWNyOGFjNjc3LTYwMmQtNDkzOS1iMDgyLWQ0MDA5ZDM1MWE5YiIsImlzcyI6IkFFTUVUIiwiaWF0IjoxNjA5NDkxNTIyLCJ1c2VySWQiOiIzMjhhYzY3Ny02MDJkLTQ5MzktYjA4Mi1kNDAwOWQzNTFhOWIiLCJyb2xlIjoiIn0.Ow5zuZbkr3-XTrLVPSfH9L2yDkEtuChdWZHVQ1Yenxc' > prueba.json && jq .datos prueba.json > datos.json && sed -i 's/"//g' datos.json && wget -i datos.json 
