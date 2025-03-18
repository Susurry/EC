extends Node2D

var audio_music: SoundMusic = SoundMusic.new("Music", 1)
var audio_sfx: SoundEffects = SoundEffects.new("SFX", 8)

func _ready():
	add_child(audio_sfx)
	add_child(audio_music)

#region SFX
func play_sfx(resource: AudioStreamWAV):
	audio_sfx.play(resource)

func stop_sfx():
	audio_sfx.stop()
#endregion

#region Musique
func play_music(resource: AudioStreamSynchronized):
	audio_music.play(resource)

func stop_music():
	audio_music.stop()

func pause_music():
	audio_music.pause()

func resume_music():
	audio_music.resume()

func set_volume(id: int, volume: float):
	audio_music.set_channel_volume(id, volume)

func fade_music(to_volume: float, duration: float):
	audio_music.fade_music(to_volume,duration)
#endregion

#region AudioBus
func set_bus(bus_id: int ,volume_db: float):
	AudioServer.set_bus_volume_db(bus_id,volume_db)

func muting_bus(bus_id: int ,is_mute: bool):
	AudioServer.set_bus_mute(bus_id, is_mute)
#endregion
