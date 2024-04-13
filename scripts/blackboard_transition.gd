@tool
extends FSMTransition

@export var key := ""
@export var threshold : float = 10

# Evaluates true, if the transition conditions are met.
func is_valid(_actor, _blackboard: Blackboard):
	var value = _blackboard.get_value(key)
	return value and value < threshold

