extends Resource
class_name GameInfo

enum GameMode{
	ONE_PLAYER,
	VS_CPU
}

@export var mode: GameMode = GameMode.ONE_PLAYER
@export var player_info_array: Array[PlayerInfo] = []
