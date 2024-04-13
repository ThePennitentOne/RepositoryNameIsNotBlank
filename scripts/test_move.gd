@tool
extends FSMState

class_name test_move

@export var target_distance : float = 100
@export var speed_linear : float = 1
@export var speed_linear_distance_factor : float = 0
@export var speed_radial : float = 1
@export var speed_radial_distance_factor : float = 0
@export var target_key := "target"
@export var distance_key := "distance"

# Executes after the state is entered.
func _on_enter(_actor, _blackboard: Blackboard):
	_blackboard.set_value(distance_key, null)
	_blackboard.set_value(target_key, Vector2(randf_range(-400, 400), randf_range(-400, 400)))
	

# Executes every _process call, if the state is active.
func _on_update(_delta, _actor, _blackboard: Blackboard):
	var actor := _actor as Node2D
	var target : Vector2 = _blackboard.get_value(target_key)

	var delta := actor.global_position - target
	var distance_raw := delta.length()
	var distance := distance_raw - target_distance
	
	var s_d : float = sign(distance)
	var x_move : float = speed_linear * s_d
	x_move += speed_linear_distance_factor * distance
	var a_dist = abs(distance)
	x_move = clamp(x_move, -a_dist, a_dist)
	
	actor.look_at(target)
	actor.move_local_x(x_move, false)
	actor.move_local_y(speed_radial + distance_raw * speed_radial_distance_factor, false)
	
	_blackboard.set_value(distance_key, distance_raw)
	

# Executes before the state is exited.
func _on_exit(_actor, _blackboard: Blackboard):
	pass
