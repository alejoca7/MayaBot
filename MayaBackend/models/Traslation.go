package models

import "gorm.io/gorm"

type Translation struct {
	gorm.Model
	SpanishWord string `gorm:"column:spanish_word;not null;unique_index" json:"spanish_word"`
	MayaWord    string `gorm:"column:maya_word;not null" json:"maya_word"`
}
