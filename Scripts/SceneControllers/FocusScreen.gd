extends Control

var t = 0
var posA
var posB
var anims = []

func _ready() -> void:
	var animJSONString = FileAccess.open("res://Assets/focusanims.json", FileAccess.READ)
	var animJSON = JSON.parse_string(animJSONString.get_as_text())
	for anim in animJSON["anims"]:
		var a = load(anim["path"])
		anims.append(a)
	print(anims[2])
	update_pos()
	get_tree().get_root().size_changed.connect(update_pos)
	$TextureRect.position = Vector2(get_viewport().get_visible_rect().size.x + $TextureRect.size.x, $TextureRect.position.y)

func update_pos():
	posA = Vector2(get_viewport().get_visible_rect().size.x + $TextureRect.size.x, $TextureRect.position.y)
	posB = Vector2(-(get_viewport().get_visible_rect().size.x + $TextureRect.size.x), $TextureRect.position.y)

func _process(delta: float) -> void:
	if(t >= 1):
		$TextureRect.texture = anims.pick_random()
		$TextureRect.position = posA
		t = 0
	t += delta * 0.1
	$TextureRect.position = posA.lerp(posB, t)
