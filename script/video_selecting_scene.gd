extends Node2D

@onready var video_stream_player: VideoStreamPlayer = $CanvasLayer/VideoStreamPlayer
@onready var title: Label = $CanvasLayer/ButtonTemplate/Title


# Array to store video titles and their file locations
var videos = [
	{"title": "Circulatory System", "path": "res://videos/CirculatorySystem.ogv"},
	{"title": "Nervous System", "path": "res://videos/NervousSystem.ogv"},
	{"title": "Digestive System", "path": "res://videos/digestive-clipped.ogv"},
	{"title": "Respiratory System","path": "res://videos/respiratory-vid-clipped.ogv"}
]

# Current video index
var current_video_index: int = 0

func _ready() -> void:
	AudioManager.stop_music()
	play_video(current_video_index)
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

# Function to play a video at a specific index
func play_video(index: int) -> void:
	if index >= 0 and index < videos.size():
		var video_info = videos[index]
		video_stream_player.stream = load(video_info["path"])
		video_stream_player.play()
		title.text = video_info["title"]

# Called when the next button is pressedD
func _on_next_button_pressed() -> void:
	current_video_index += 1
	if current_video_index >= videos.size():
		current_video_index = 0  # Loop back to the first video
	play_video(current_video_index)

# Called when the previous button is pressed
func _on_previous_button_pressed() -> void:
	current_video_index -= 1
	if current_video_index < 0:
		current_video_index = videos.size() - 1  # Loop back to the last video
	play_video(current_video_index)


func _on_home_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/lab.tscn")
	
