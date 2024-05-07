package routes

import (
	"encoding/json"
	"errors"
	"net/http"
	"strings"

	"github.com/alejoca7/mayabackend/db"
	"github.com/alejoca7/mayabackend/models"
	"github.com/gorilla/mux"
	"gorm.io/gorm"
)

// Manejador para obtener la traducción de una palabra en español
func PostTranslationBySpanishWordHandler(w http.ResponseWriter, r *http.Request) {
	// Decodificar el cuerpo de la solicitud JSON
	var requestBody struct {
		SpanishWord string `json:"spanish_word"`
	}
	err := json.NewDecoder(r.Body).Decode(&requestBody)
	if err != nil {
		w.WriteHeader(http.StatusBadRequest)
		w.Write([]byte("Invalid request body"))
		return
	}

	// Buscar la traducción en la base de datos
	var translation models.Translation
	if err := db.DB.Where("spanish_word = ?", requestBody.SpanishWord).First(&translation).Error; err != nil {
		if errors.Is(err, gorm.ErrRecordNotFound) {
			w.WriteHeader(http.StatusNotFound)
			w.Write([]byte("Translation not found"))
			return
		}
		w.WriteHeader(http.StatusInternalServerError)
		w.Write([]byte("Internal server error"))
		return
	}

	// Se encontró la traducción
	response := map[string]string{"spanish_word": translation.SpanishWord, "maya_word": translation.MayaWord}
	json.NewEncoder(w).Encode(response)
}

// Obtener traducción de una palabra en español
func GetTranslationBySpanishWordHandler(w http.ResponseWriter, r *http.Request) {
	params := mux.Vars(r)
	var translation models.Translation

	// Convertir la palabra recibida a minúsculas
	spanishWord := strings.ToLower(params["spanish_word"])

	if err := db.DB.Where("spanish_word = ?", spanishWord).First(&translation).Error; err != nil {
		if errors.Is(err, gorm.ErrRecordNotFound) {
			w.WriteHeader(http.StatusNotFound)
			w.Write([]byte("Translation not found"))
			return
		}
		w.WriteHeader(http.StatusInternalServerError)
		w.Write([]byte("Internal server error"))
		return
	}

	// Se encontró la traducción
	response := map[string]string{"spanish_word": translation.SpanishWord, "maya_word": translation.MayaWord}
	json.NewEncoder(w).Encode(response)
}

// Obtener traducción de una palabra en maya
func GetTranslationByMayaWordHandler(w http.ResponseWriter, r *http.Request) {
	params := mux.Vars(r)
	var translation models.Translation

	// Convertir la palabra recibida a minúsculas
	mayaWord := strings.ToLower(params["maya_word"])

	if err := db.DB.Where("maya_word = ?", mayaWord).First(&translation).Error; err != nil {
		if errors.Is(err, gorm.ErrRecordNotFound) {
			w.WriteHeader(http.StatusNotFound)
			w.Write([]byte("Translation not found"))
			return
		}
		w.WriteHeader(http.StatusInternalServerError)
		w.Write([]byte("Internal server error"))
		return
	}

	// Se encontró la traducción
	response := map[string]string{"maya_word": translation.MayaWord, "spanish_word": translation.SpanishWord}
	json.NewEncoder(w).Encode(response)
}

// Obtener todas las traducciones
func GetTranslationsHandler(w http.ResponseWriter, r *http.Request) {
	var translations []models.Translation
	db.DB.Find(&translations)
	json.NewEncoder(w).Encode(&translations)
}

// Agregar una nueva traducción
func PostTranslationHandler(w http.ResponseWriter, r *http.Request) {
	var translation models.Translation
	json.NewDecoder(r.Body).Decode(&translation)

	createdTranslation := db.DB.Create(&translation)
	err := createdTranslation.Error
	if err != nil {
		w.WriteHeader(http.StatusBadRequest)
		w.Write([]byte(err.Error()))
		return
	}

	json.NewEncoder(w).Encode(&translation)
}

// Eliminar una traducción
func DeleteTranslationHandler(w http.ResponseWriter, r *http.Request) {
	var translation models.Translation
	params := mux.Vars(r)
	db.DB.First(&translation, params["id"])
	if translation.ID == 0 {
		w.WriteHeader(http.StatusNotFound)
		w.Write([]byte("Translation not found"))
		return
	}

	db.DB.Unscoped().Delete(&translation)
	w.WriteHeader(http.StatusOK)
}
