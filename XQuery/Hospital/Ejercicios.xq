(: 1 Mostrar la lista de los medicamentos recetados
y el precio de los mismos recetados
a los pacientes que necesitan tratamiento de Traumatología.

Se deben mostrar en orden ascendente según el nombre del medicamento :)

for $i in doc("HospitalDB/medicos.xml")//medico[especialidad="Traumatologia"]/pacientes/paciente/historial_clinico/@codigoPaciente

let $medicamento := doc("HospitalDB/medicamentos.xml")//receta[@codigoPaciente = $i]/nombre
let $precio := doc("HospitalDB/medicamentos.xml")//receta[@codigoPaciente = $i]/precio

return ($medicamento,$precio)/text()

(: 2 Mostrar el nombre de los pacientes que tienen una prioridad alta
y la fecha en la que ingresaron al hospital :)

for $paciente in doc("HosptitalDB/medicos.xml")//paciente

let $historialClinico := doc("HospitalDB/medicos.xml")//historial_clinico[@codigoPaciente= $paciente/@codigoPaciente]
where $historialClinico/prioridad = "Alta"
order by $paciente/nombre
return concat("Paciente: ",$paciente/nombre," F. Ingreso: ",$paciente/fecha_ingreso)

(: 3 Mostrar los nombres de los pacientes que necesitan una operación
junto con la especialidad por la que se van a operar :)

for $i in doc("HospitalDB/medicos.xml")//medico/pacientes/paciente/historial_clinico [@operacion = "Si"]

let $nombre_pac := doc("HospitalDB/pacientes.xml")//paciente[@codigoPaciente = $i/@codigoPaciente]/nombre

let $especialidad_pac := doc("HospitalDB/medicos.xml")//medico[pacientes/paciente/
historial_clinico/@codigoPaciente = $i/@codigoPaciente]/especialidad

return ($nombre_pac ,$especialidad_pac)/text()

(: 4 Mostrar el precio medio de los medicamentos
que se han recetado en la especialidad de Traumatología :)

(: 5 Mostrar el nombre y apellidos de todos los médicos
que tienen pacientes con prioridad media :)