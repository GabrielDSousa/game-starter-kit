extends CommonButton

const MAIN_GAME = preload("res://Game/MainGame/main_game.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super()
	pressed.connect(new_game)

func new_game() -> void:
	#TODO: If have a saved game, opens a warning if wants to start a new game
	#TODO: If have only one save, opens a warning remembering the save will be overwrited
	await super.play_pressed_sound()
	go_to(MAIN_GAME)
