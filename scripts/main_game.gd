extends Node2D
class_name main

const male_human = preload("res://scenes/humans.tscn")

func _ready():
	var chara = male_human.instantiate()
	add_child(chara)
