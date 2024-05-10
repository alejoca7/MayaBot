# Mayabot
### MayaBot API
MayaBot API es una API RESTful diseñada para ofrecer servicios de traducción del español al idioma maya Q’eqchi’. Utiliza tecnologías modernas para proporcionar una experiencia rápida y confiable en la traducción de palabras y frases del español al maya Q’eqchi’.

## Descripción
La MayaBot API permite a los usuarios pueden enviar solicitudes para traducir palabras y frases del español al maya Q’eqchi’ de manera rápida y precisa.

## Endpoints Disponibles
GET /users: Obtiene la lista de usuarios registrados en la plataforma.
GET /users/{id}: Obtiene los detalles de un usuario específico por su ID.
POST /users: Crea un nuevo usuario en la plataforma.
PUT /users/{id}: Actualiza la información de un usuario existente por su ID.
DELETE /users/{id}: Elimina un usuario existente por su ID.

## Para utilizar la MayaBot API, sigue estos pasos:

Realiza una solicitud HTTP GET al endpoint correspondiente.
Proporciona la palabra en español que deseas traducir como parte de la URL.
Recibe la respuesta de la API, que incluirá la traducción al maya Q’eqchi’ de la palabra solicitada.
Ejemplo de Uso
```
GET /translations/spanish/hola
Respuesta Exitosa
```
```
{
  "original_word": "hola",
  "maya_translation": "sakab'ik",
  "part_of_speech": "interjección"
}
```
## Requisitos
Para utilizar la MayaBot API, necesitarás tener acceso a Internet y poder realizar solicitudes HTTP GET. Además, asegúrate de leer la documentación completa de la API para comprender todas las funcionalidades disponibles y las mejores prácticas para su integración.

## Uso de la Aplicación en Flutter
Para utilizar la aplicación MayaBot en Flutter, sigue estos pasos:

Clona el repositorio de la aplicación MayaBot desde GitHub.
Abre el proyecto en tu entorno de desarrollo preferido, como Android Studio o Visual Studio Code.
Instala todas las dependencias del proyecto utilizando el comando flutter pub get.
Ejecuta la aplicación en un emulador o dispositivo físico utilizando el comando flutter run.
Una vez que la aplicación esté en funcionamiento, podrás utilizarla para traducir palabras y frases del español al maya Q’eqchi’ de forma interactiva.

## Configuración de la Base de Datos
MayaBot utiliza una base de datos PostgreSQL para almacenar la información de los usuarios. Sigue estos pasos para configurar la base de datos:

Instala PostgreSQL en tu máquina local si aún no lo has hecho.
Crea una nueva base de datos con el nombre mayabot.
Ejecuta el script SQL database.sql ubicado en la carpeta database para crear las tablas necesarias en la base de datos.
Levantar el Contenedor de la Base de Datos
También puedes optar por ejecutar la base de datos PostgreSQL en un contenedor de Docker. Sigue estos pasos:

Asegúrate de tener Docker instalado en tu máquina.
Ejecuta el siguiente comando en la terminal para crear y levantar un contenedor PostgreSQL:
```
docker run --name mayabot-db -e POSTGRES_PASSWORD=mysecretpassword -p 5432:5432 -d postgres
```
Este comando crea un contenedor con el nombre mayabot-db, establece la contraseña de la base de datos como mysecretpassword y expone el puerto 5432.

