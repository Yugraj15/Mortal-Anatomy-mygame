extends AudioStreamPlayer

const level_music = preload("res://music/Music.mp3")
const main_menu_music = preload("res://music/Music.mp3")

func _play_music(music: AudioStream, volume=0.0):
	if stream==music:
		return
		
	stream=music
	volume_db=volume
	play()
	
func play_music_level():
	_play_music(level_music)
	
func play_mainmenu_music():
	_play_music(main_menu_music)
	
func stop_music():
	if is_playing():
		stop()
		
	
	
func play_FX(stream: AudioStream, volume=0.0):
	var fx_player=AudioStreamPlayer.new()
	fx_player.stream=stream
	fx_player.name="FX_PLAYER"
	fx_player.volume_db=volume
	add_child(fx_player)
	fx_player.play()
	await fx_player.finished
	fx_player.queue_free()
