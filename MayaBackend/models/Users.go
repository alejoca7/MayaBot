package models

import "gorm.io/gorm"

type User struct {
	gorm.Model
	UserID   string `gorm:"column:userid;not null;unique_index" json:"userid"`
	Email    string `gorm:"column:email;not null;unique_index" json:"email"`
	Password string `gorm:"column:password;not null" json:"pass"`
}
