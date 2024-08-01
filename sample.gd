extends Control

var sounds = []
var words = [
	"maman",
	"papa",
	"assis",
	"bebe",
	"dodo",
	"doudou",
	"lapin",
	"manger",
	"mimi",
	"oui"
]
var current = 0
var last = 1

@onready var nick_label : Label = get_node("%Nickname")
@onready var avatar : TextureRect = get_node("%Avatar")

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
	_randomize_word()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$PlayerInfoBox/PlayBtn.disabled = $AudioStreamPlayer2D.is_playing()

func _on_button_pressed():
	if !$AudioStreamPlayer2D.is_playing():
		$AudioStreamPlayer2D.stream = sounds[current]
		$AudioStreamPlayer2D.play();
		

func _on_button_2_pressed():
	_randomize_word()
	
func _randomize_word():
	current = randi() % sounds.size() # Replace with function body.
	if current == last:
		current = randi() % sounds.size()
	last = current
	
	nick_label.text = str(words[current])	
	avatar.texture = load("res://assets/avatar/" + words[current] +".webp")
