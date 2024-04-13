@tool
extends FSMState

class_name FSMTimedState

func _on_enter(_actor, _blackboard: Blackboard):
	_reset_time(_blackboard)
	_on_enter2(_actor, _blackboard)
	pass

# Executes every _process call, if the state is active.
func _on_update(_delta, _actor, _blackboard: Blackboard):
	_update_time(_delta, _blackboard)
	_on_update2(_delta, _actor, _blackboard)
	pass

func _on_exit(_actor: Node, _blackboard: Blackboard) -> void:
	print("Exiting: ", self, "; After: ", BBoard.get_local(_blackboard, Constants.time_in_state))
	_on_exit2(_actor, _blackboard)

func _update_time(_delta, _blackboard: Blackboard) -> void:
	var local := BBoard.local(_blackboard)
	var time_in_state : float = local.get_value(Constants.time_in_state)
	time_in_state = time_in_state if time_in_state else 0.0
	local.set_value("time_in_state", time_in_state + _delta)

func _reset_time(_blackboard: Blackboard) -> void:
	BBoard.set_local(_blackboard, Constants.time_in_state, 0.0)

func _on_update2(_delta : float, _actor, _blackboard : Blackboard) -> void:
	pass

func _on_enter2(_actor, _blackboard: Blackboard):
	pass
	
func _on_exit2(_actor, _blackboard: Blackboard):
	pass
