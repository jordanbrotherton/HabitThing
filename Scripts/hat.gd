class_name Hat extends Node

var hatName = "Hat"
var hatDesc = "A placeholder hat."
var spritePath = "res://lilguy/base/base.tres"
var cost = 0

func _init(n, d, p, c) -> void:
    hatName = n
    hatDesc = d
    spritePath = p
    cost = c

