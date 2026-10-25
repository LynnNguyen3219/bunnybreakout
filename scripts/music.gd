extends Node2D

@onready var music = $Music
@onready var sfx = [$Collide, $Broken, $Confirm]
var musicmute = false
var sfxmute = false

func toggleMusic() -> void:
	musicmute = !musicmute
	music.stream_paused = musicmute

func toggleSfx() -> void:
	sfxmute = !sfxmute
	for player in sfx:
		player.stream_paused = sfxmute

func _ready():
	if not musicmute:
		play_music()

func play_music():
	if not sfxmute:
		$Music.play()
		
func play_collide():
	if not sfxmute:
		$Collide.play()

func play_broken():
	if not sfxmute:
		$Broken.play()
		
func play_confirm():
	if not sfxmute:
		$Confirm.play()
