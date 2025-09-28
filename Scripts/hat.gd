class_name Hat extends Node

var hatName = "Hat"
var hatDesc = "A placeholder hat."
var spritePath = "res://lilguy/base/base.tres"
var cost = 0
var hatRar = "Common"

func _init(n, c, r, p, d) -> void:
	hatName = n
	hatDesc = d
	spritePath = p
	cost = c
	hatRar = r
