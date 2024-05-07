package routes

import (
	"encoding/json"
	"errors"
	"net/http"

	"github.com/alejoca7/mayabackend/db"
	"github.com/alejoca7/mayabackend/models"
	"github.com/gorilla/mux"
	"gorm.io/gorm"
)

func AuthenticateUserHandler(w http.ResponseWriter, r *http.Request) {
	var authRequest models.User
	if err := json.NewDecoder(r.Body).Decode(&authRequest); err != nil {
		w.WriteHeader(http.StatusBadRequest)
		w.Write([]byte("Invalid request body"))
		return
	}

	var user models.User
	if err := db.DB.Where("userid = ?", authRequest.UserID).First(&user).Error; err != nil {
		if errors.Is(err, gorm.ErrRecordNotFound) {
			w.WriteHeader(http.StatusUnauthorized)
			w.Write([]byte("Invalid username"))
			return
		}
		w.WriteHeader(http.StatusInternalServerError)
		w.Write([]byte("Internal server error"))
		return
	}

	if user.Password != authRequest.Password {
		w.WriteHeader(http.StatusUnauthorized)
		w.Write([]byte("Invalid password"))
		return
	}

	// User authenticated successfully
	w.WriteHeader(http.StatusOK)
	json.NewEncoder(w).Encode(&authRequest)
}

func GetUsersHandler(w http.ResponseWriter, r *http.Request) {
	var users []models.User
	db.DB.Find(&users)
	json.NewEncoder(w).Encode(&users)

}

// Obtener usuarios
func GetUserHandler(w http.ResponseWriter, r *http.Request) {
	var user models.User
	params := mux.Vars(r)

	db.DB.First(&user, params["id"])

	if user.ID == 0 {
		w.WriteHeader(http.StatusNotFound)
		w.Write([]byte("User not found"))
		return
	}
	//db.DB.Model(&user).Association("Tasks").Find(&user.Tasks)
	json.NewEncoder(w).Encode(&user)
}

// Crear un usuario
func PostUserHandler(w http.ResponseWriter, r *http.Request) {
	var user models.User
	json.NewDecoder(r.Body).Decode(&user)

	createdUser := db.DB.Create(&user)
	err := createdUser.Error
	if err != nil {
		w.WriteHeader(http.StatusBadRequest) //code 400
		w.Write([]byte(err.Error()))
	}

	json.NewEncoder(w).Encode(&user)
}

// Eliminar usuarios
func DeleteUserHandler(w http.ResponseWriter, r *http.Request) {
	var user models.User
	params := mux.Vars(r)
	db.DB.First(&user, params["id"])
	if user.ID == 0 {
		w.WriteHeader(http.StatusNotFound)
		w.Write([]byte("User not found"))
		return
	}

	db.DB.Unscoped().Delete(&user)
	w.WriteHeader(http.StatusOK)

}
