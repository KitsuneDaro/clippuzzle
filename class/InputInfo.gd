extends Resource
class_name InputInfo

@export var moving_flag: bool
@export var moving_way: int
@export var hard_dropping_flag: bool
@export var rotating_flag: bool
@export var rotating_way: int

func _init(
	moving_flag: bool = false,
	moving_way: int = 0,
	hard_dropping_flag: bool = false,
	rotating_flag: bool = false,
	rotating_way: int = 0,
):
	self.moving_flag = moving_flag
	self.moving_way = moving_way
	
	self.hard_dropping_flag = hard_dropping_flag
	
	self.rotating_flag = rotating_flag
	self.rotating_way = rotating_way
