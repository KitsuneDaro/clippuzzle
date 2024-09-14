extends Resource
class_name PlayerInfo

enum ControllerState{
	SET_ALLY_BLOCK,
	FALLING_ALLY_BLOCK,
	CONFIRMING_ALLY_BLOCK,
	FALLING_ENEMY_BLOCK,
	CONFIRMING_ENEMY_BLOCK,
}

@export var controller_state: ControllerState
@export var board_info: BoardInfo
var input_info: InputInfo = InputInfo.new()

var score: int = 0

func _init(
	controller_state: ControllerState = ControllerState.SET_ALLY_BLOCK,
	board_info: BoardInfo = BoardInfo.new()
):
	self.controller_state = controller_state
	self.board_info = board_info
