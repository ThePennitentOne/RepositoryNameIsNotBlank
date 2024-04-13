@tool
extends FSMTransition

class_name FSMTimedTransition

@export var time : float

func _on_transition(_delta, _actor, _blackboard: Blackboard):
	pass


func is_valid(_actor, _blackboard: Blackboard):
	var local : Blackboard =_blackboard.get_value("local")
	var time_in_state = local.get_value(Constants.time_in_state);
#	print("time_in_state: ", time_in_state)
	return time_in_state and time_in_state >= time