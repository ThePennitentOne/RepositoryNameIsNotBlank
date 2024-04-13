@tool
extends FSMTransition

class_name FSMAlwaysTransition


func is_valid(_actor, _blackboard: Blackboard):
	return true