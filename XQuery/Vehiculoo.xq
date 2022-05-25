"Estos son los usuarios que tiene Audi", " ",
(:FLWOR:)

for $i in /vehiculos/vehiculo
where $i/modelo="Audi"
return $i/destinatario
," "

,"Estos son los destinos que tienen los Peugeot", " ",

for $i in //vehiculo
where $i/modelo="Peugeot"
return $i/destino
," "

,"Propietarios que tengan un Peugeot y residan en Francia", " ",

for $i in //vehiculo
where $i /modelo="Peugeot" and $i/destino="France"
order by $i/identificador
return ($i/destinatario, $i/identificador/data())
