extends Button

var tween_intensity : float = 1.1
var tween_duration : float = 0.3
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	btn_hovered(self)


func start_tween(object : Object, property : String, final_val : Variant, duration : float ):
	var tween = create_tween()
	tween.tween_property(object,property,final_val,duration)
	
func btn_hovered(button:Button):
	#button.pivot_offset = button.size/2
	if button.is_hovered():
		start_tween(button,"scale",Vector2(0.95,0.95) * tween_intensity,tween_duration)
	else:
		start_tween(button,"scale",Vector2(1,1),tween_duration)
