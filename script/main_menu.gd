extends Node3D


@onready var anatomy: Sprite2D = $CanvasLayer/Anatomy
@onready var play_button: Button = $CanvasLayer/PlayButton
@onready var quit_button: Button = $CanvasLayer/QuitButton
@onready var cinematics_player: AnimationPlayer = $CinematicsPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	AudioManager.play_music_level()
	anatomy.visible = true
	play_button.visible = true
	quit_button.visible = true
	play_button.disabled = false
	play_button.disabled = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_play_button_pressed() -> void:
	anatomy.visible = false
	play_button.visible = false
	quit_button.visible = false
	play_button.disabled = true
	quit_button.disabled = true
	cinematics_player.play("Cinematics")
	

func _on_quit_button_pressed() -> void:
	get_tree().quit()


func _on_cinematics_player_animation_finished(anim_name: StringName) -> void:
	if (anim_name == "Cinematics"):
		get_tree().change_scene_to_file("res://scenes/lab.tscn")
