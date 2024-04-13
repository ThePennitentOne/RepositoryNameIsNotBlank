@tool
extends FSMState

class_name FSMBoardInit

@export var global_board : Blackboard;

# Executes after the state is entered.
func _on_exit(_actor, _blackboard: Blackboard):
	_blackboard.set_value("local", Blackboard.new())
	_blackboard.set_value("global", global_board)
	pass
