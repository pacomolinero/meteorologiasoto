#!/bin/bash

#ini=2020-12-27T00%3A00%3A00UTC
#fin=2020-12-31T00%3A00%3A00UTC


curl -X GET --header 'Accept: application/json' --header 'api_key: eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJwYWNvQGJ5YXNsLmNvbSIsImp0aSI6IjMyOGFjNjc3LTYwMmQtNDkzOS1iMDgyLWQ0MDA5ZDM1MWE5YiIsImlzcyI6IkFFTUVUIiwiaWF0IjoxNjA5NDkxNTIyLCJ1c2VySWQiOiIzMjhhYzY3Ny02MDJkLTQ5MzktYjA4Mi1kNDAwOWQzNTFhOWIiLCJyb2xlIjoiIn0.24031959Ow5zuZbkr3-XTrLVPSfH9L2yDkEtuChdWZHVQ1Yenxc' 'https://opendata.aemet.es/opendata/api/valores/climatologicos/diarios/datos/fechaini/2021-01-01T00%3A00%3A00UTC/fechafin/2021-12-31T00%3A00%3A00UTC/estacion/3191E' > prueba.json && jq .datos prueba.json > datos.json && sed -i 's/"//g' datos.json && wget -i datos.json 
