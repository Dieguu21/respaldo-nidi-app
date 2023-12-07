# README - NiDi App

## Enlaces útiles
* Página: https://nidi-app.herokuapp.com/
* Trello: https://trello.com/b/sVaNu7jU/software-2022-1

## Consideraciones Sprint 2
* Se implementaron seeds.
* Todo el flujo del chofer funciona, excepto que las solicitudes se acepten manualmente (apretando el boton aceptar o rechazar). Por la negociacion conversada esto se realizó de manera automática (cuando un usuario apreta el botón de inscribirse este queda automáticamente inscrito solo si hay cupos).
  * Chofer puede publicar sus turnos.
  * Chofer puede ver sus turnos.
  * Chofer puede eliminar sus turnos.
  * Chofer puede editar sus turnos.
  * Chofer puede ver reseñas recibidas.

* Todo el flujo del pasajero funciona
  * Pasajero puede ver turnos de los otros choferes.
  * Pasajero puede solicitar e inscribirse en un turno.
  * Pasajero puede ver sus inscripciones.
  * Pasajero puede borrar sus inscripciones.
  * Pasajero puede calificar al chofer del turno inscrito.
  * Pasajero puede ver reseñas realizadas, editar y eliminar.

* CRUD de reseñas realizado completo

* No hicimos testing :c
* No hicimos el filtro de turnos.
* No hicimos Bulma ni bootstrap.
* Las reseñas se pueden editar, pero no hay un mensaje de confirmacion. Al presionar "back" se puede ver la reseña editada. 

## Versiones
* Ruby: Ruby 2.6.6
* Rails: Rails 6.0.4.7
