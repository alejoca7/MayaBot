package main

import (
	"net/http"

	"github.com/alejoca7/mayabackend/db"
	"github.com/alejoca7/mayabackend/models"
	"github.com/alejoca7/mayabackend/routes"
	"github.com/gorilla/mux"
)

func main() {

	db.DBconnection()

	db.DB.AutoMigrate(models.Task{})
	db.DB.AutoMigrate(models.User{})
	db.DB.AutoMigrate(models.Translation{})

	r := mux.NewRouter()

	r.HandleFunc("/", routes.HomeHandler)
	r.HandleFunc("/users", routes.GetUsersHandler).Methods("GET")
	r.HandleFunc("/users", routes.PostUserHandler).Methods("POST")
	r.HandleFunc("/users/{id}", routes.GetUserHandler).Methods("GET")
	r.HandleFunc("/users/{id}", routes.DeleteUserHandler).Methods("DELETE")

	// Nueva ruta para autenticación de usuarios
	r.HandleFunc("/auth", routes.AuthenticateUserHandler).Methods("POST")
	// Nueva ruta para manejo del traductor de palabras
	r.HandleFunc("/translations", routes.PostTranslationHandler).Methods("POST")
	r.HandleFunc("/translations/{id}", routes.DeleteTranslationHandler).Methods("DELETE")
	r.HandleFunc("/translations/spanish", routes.PostTranslationBySpanishWordHandler).Methods("POST")
	r.HandleFunc("/translations/spanish/{spanish_word}", routes.GetTranslationBySpanishWordHandler).Methods("GET")
	r.HandleFunc("/translations/maya/{maya_word}", routes.GetTranslationByMayaWordHandler).Methods("GET")

	http.ListenAndServe(":3001", r)
}
