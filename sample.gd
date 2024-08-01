extends Control

var is_playing : bool
var sounds = []
var current = 0

@onready var nick_label : Label = get_node("%Nickname")

# Called when the node enters the scene tree for the first time.
func _ready():
	sounds.append(preload("res://assets/audio/maman.wav"))
	sounds.append(preload("res://assets/audio/papa.wav"))
	sounds.append(preload("res://assets/audio/assis.wav"))
	sounds.append(preload("res://assets/audio/bebe.wav"))
	sounds.append(preload("res://assets/audio/dodo.wav"))
	sounds.append(preload("res://assets/audio/doudou.wav"))
	sounds.append(preload("res://assets/audio/lapin.wav"))
	sounds.append(preload("res://assets/audio/manger.wav"))
	sounds.append(preload("res://assets/audio/mimi.wav"))
	sounds.append(preload("res://assets/audio/oui.wav"))
	randomize()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Button.disabled = $AudioStreamPlayer2D.is_playing()

func _on_button_pressed():
	if !$AudioStreamPlayer2D.is_playing():
		$AudioStreamPlayer2D.stream = sounds[current]
		$AudioStreamPlayer2D.play();
		nick_label.text = str(is_playing)


func _on_button_2_pressed():
	current = randi() % sounds.size() # Replace with function body.
