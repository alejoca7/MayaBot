package routes

import (
	"encoding/json"
	"net/http"

	"github.com/alejoca7/mayabackend/db"
	"github.com/alejoca7/mayabackend/models"
	"github.com/gorilla/mux"
)

func GetTasksHandler(w http.ResponseWriter, r *http.Request) {
	var tasks []models.Task
	db.DB.Find(&tasks)
	json.NewEncoder(w).Encode(tasks)
}

func CreateTaskHandler(w http.ResponseWriter, r *http.Request) {
	var task models.Task
	json.NewDecoder(r.Body).Decode(&task)
	createdTask := db.DB.Create(&task)
	err := createdTask.Error

	if err != nil {
		w.WriteHeader(http.StatusBadRequest) //400 not found
		w.Write([]byte(err.Error()))
		return
	}

	json.NewEncoder(w).Encode(&task)

}

func GetTaskHandler(w http.ResponseWriter, r *http.Request) {
	var task models.Task
	params := mux.Vars(r)

	db.DB.First(&task, params["id"])

	if task.ID == 0 {
		w.WriteHeader(http.StatusNotFound) //404 no found
		w.Write([]byte("Tareas no funcionan"))
		return
	}
	json.NewEncoder(w).Encode(&task)
}

func DeleteTaskhandler(w http.ResponseWriter, r *http.Request) {
	var task models.Task
	params := mux.Vars(r)

	db.DB.First(&task, params["id"])

	if task.ID == 0 {
		w.WriteHeader(http.StatusNotFound) //404 no found
		w.Write([]byte("Tareas no funcionan"))
		return
	}
	db.DB.Unscoped().Delete(&task)
	w.WriteHeader(http.StatusNoContent) //204 no found
}
