class_name CommonButton
extends Button

const CLICK_BUTTON_SOUND = preload("res://Assets/Audio/UI/click_button_sound.ogg")
const HOVER_BUTTON_SOUND = preload("res://Assets/Audio/UI/hover_button_sound.ogg")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pressed.connect(play_pressed_sound)
	mouse_entered.connect(play_hovered_sound)

func go_to(scene: Resource) -> void:
	TransitionScreen.transition()
	await TransitionScreen.trasition_finished
	get_tree().change_scene_to_packed(scene)

func play_pressed_sound() -> void:
	await _play_sound(CLICK_BUTTON_SOUND)

func play_hovered_sound() -> void:
	await _play_sound(HOVER_BUTTON_SOUND)

func _play_sound(sound: Resource) -> void:
	var audio_player = AudioStreamPlayer.new()
	audio_player.stream = sound
	audio_player.bus = "UI"
	add_child(audio_player)
	audio_player.play()
	await  audio_player.finished
	remove_child(audio_player)
