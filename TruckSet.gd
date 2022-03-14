extends Node3D

@export var front_truck_pos: float
@export var truck_spacing := 10.0

@export_node_path(Path3D) var track_path
@onready var track = get_node(track_path)

# Called when the node enters the scene tree for the first time.
func _ready():
	add_path_followers()

func add_path_followers():
	var front_follow = PathFollow3D.new()
	var front_pos = Position3D.new()
	track.add_child(front_follow)
	front_follow.add_child(front_pos)
	front_follow.offset = front_truck_pos
	
	var back_follow = PathFollow3D.new()
	var back_pos = Position3D.new()
	track.add_child(back_follow)
	back_follow.add_child(back_pos)
	back_follow.offset = front_truck_pos - truck_spacing

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
