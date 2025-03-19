extends AudioPool
class_name SoundEffects

# Utiliser pour jouer des sfx
func play(resource: AudioStreamWAV) -> void:
	var player: AudioStreamPlayer = select_player(resource)
	player.call_deferred("play")

# Utiliser pour arrêter tout les sfx
func stop() -> void:
	for player in audio_players:
		player.call_deferred("on_player_finished")
