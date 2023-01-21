extends KinematicBody2D

var playerInstance = {
	"Points": 0,
	"Speed": 500,
	"StartPosition": Vector2.ZERO,
	"DeathTime": 5,
	"InputDir": Vector2.ZERO,
	"Velocity": Vector2.ZERO,
	"SkinMaterial": Texture
}

var player1_material = load("res://ColorTiles/Circle_blue.png")
var player2_material = load("res://ColorTiles/Circle_green.png")

onready var pointLabel = get_node("ScoreLabel")
onready var sprite = get_node("Sprite")
onready var tileMap = get_parent().get_node("TileMap")

func _ready():
	playerInstance = {
		"Points": 0,
		"Speed": 500,
		"StartPosition": Vector2.ZERO,
		"DeathTime": 5,
		"InputDir": Vector2.ZERO,
		"Velocity": Vector2.ZERO,
		"SkinMaterial": Texture
	}
	if name == "Player1":
		playerInstance.SkinMaterial = player1_material
	if name == "Player2":
		playerInstance.SkinMaterial = player2_material
		
	sprite.texture = playerInstance.SkinMaterial
	playerInstance.StartPosition = position
	
func get_input():
	playerInstance.Velocity = Vector2()
	
	if name == "Player1":
		playerInstance.InputDir.x = int(Input.is_action_pressed("Player1_right")) - int(Input.is_action_pressed("Player1_left"))
		playerInstance.InputDir.y = int(Input.is_action_pressed("Player1_down")) - int(Input.is_action_pressed("Player1_up"))
	if name == "Player2":
		playerInstance.InputDir.x = int(Input.is_action_pressed("Player2_right")) - int(Input.is_action_pressed("Player2_left"))
		playerInstance.InputDir.y = int(Input.is_action_pressed("Player2_down")) - int(Input.is_action_pressed("Player2_up"))
		
	playerInstance.Velocity = playerInstance.InputDir
	playerInstance.Velocity = playerInstance.Velocity.normalized() * playerInstance.Speed
	
func _physics_process(delta):
	get_input()
	playerInstance.Velocity = move_and_slide(playerInstance.Velocity)
