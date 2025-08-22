extends CommonButton

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super()
	pressed.connect(quit_game)

func quit_game() -> void:
	await super.play_pressed_sound()
	get_tree().quit()
