class_name BBoard

static func set_local(board : Blackboard, key : StringName, value : Variant) -> void:
    var local : Blackboard = board.get_value("local")
    local.set_value(key, value)

static func get_local(board : Blackboard, key : StringName) -> Variant:
    var local := BBoard.local(board)
    return local.get_value(key)

static func local(board : Blackboard) -> Blackboard:
    return board.get_value("local")