extends CanvasLayer

signal trasition_finished

@onready var color_rect: ColorRect = $ColorRect
@onready var animation_player: AnimationPlayer = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	color_rect.visible = false
	animation_player.animation_finished.connect(_on_animation_finished)

func _on_animation_finished(anim_name: String) -> void:
	if anim_name == "fade_in":
		trasition_finished.emit()
		animation_player.play("fade_out")
		return

	color_rect.visible = false

func transition() -> void:
	color_rect.visible = true
	animation_player.play("fade_in")
