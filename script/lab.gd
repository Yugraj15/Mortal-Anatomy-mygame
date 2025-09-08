extends Node3D


@onready var digestive: Node3D = $Models/digestive
@onready var skeleton: Node3D = $Models/skeleton
@onready var nervous: Node3D = $Models/nervous
@onready var muscles: Node3D = $"unchanged models/muscles"
@onready var respiratory: Node3D = $Models/respiratory
@onready var eye: Node3D = $"unchanged models/eye"
@onready var circulatory: Node3D = $Models/circulatory
@onready var musclesys: Node3D = $Models/musclesys

@onready var upperbody_2: Node3D = $"unchanged models/upperbody2"
@onready var brain: Node3D = $"unchanged models/brain"
@onready var heart: Node3D = $"unchanged models/heart"
@onready var animation_player: AnimationPlayer = $"unchanged models/muscles/AnimationPlayer"

var showmodel=""

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	AudioManager.play_music_level()
	respiratory.visible=false
	skeleton.visible=false
	digestive.visible=false
	nervous.visible = false
	circulatory.visible=false
	musclesys.visible=false
	# Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	modelshow()
	constant_rotation()
	animation_player.play()
	pass
	
func modelshow():
	if showmodel=="skeleton":
		respiratory.visible=false
		digestive.visible=false
		nervous.visible = false
		skeleton.visible=true
		circulatory.visible=false
		musclesys.visible=false
		
	elif showmodel == "digestive":
		respiratory.visible=false
		skeleton.visible=false
		nervous.visible = false
		digestive.visible=true
		circulatory.visible=false
		musclesys.visible=false
		
	elif showmodel == "nervous":
		respiratory.visible=false
		skeleton.visible=false
		digestive.visible=false
		nervous.visible = true
		circulatory.visible=false
		musclesys.visible=false
		
	elif showmodel == "respiratory":
		skeleton.visible=false
		digestive.visible=false
		nervous.visible = false
		musclesys.visible=false
		respiratory.visible=true
		circulatory.visible=false
		
	elif showmodel == "circulatory":
		musclesys.visible=false
		skeleton.visible=false
		digestive.visible=false
		nervous.visible = false
		respiratory.visible=false
		circulatory.visible=true
	elif showmodel == "musclesys":
		skeleton.visible=false
		digestive.visible=false
		nervous.visible = false
		respiratory.visible=false
		circulatory.visible=false
		musclesys.visible=true	
	
		
		
		
func cgshowmodel(name):
	if name=="skeletonbutton":
		showmodel="skeleton"
	elif name=="digestivebutton":
		showmodel="digestive"
	elif name=="nervousbutton":
		showmodel="nervous"
	elif name=="respiratorybutton":
		showmodel="respiratory"
	elif name=="circulatorybutton":
		showmodel="circulatory"
	elif name=="musclebutton":
		showmodel="musclesys"
	elif name == "WatchButton":
		get_tree().change_scene_to_file("res://scenes/video_selecting_scene.tscn")
		
	
func constant_rotation():
	if heart:
		var rotation_angle = deg_to_rad(0.3)
		heart.rotate_y(rotation_angle)
		upperbody_2.rotate_y(rotation_angle)
		brain.rotate_y(rotation_angle)
		muscles.rotate_y(rotation_angle)
		eye.rotate_y(rotation_angle)
		


	
	
	
