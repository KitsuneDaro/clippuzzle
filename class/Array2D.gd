class_name Array2D

var array: Array
var size: Vector2i

func _init(size: Vector2i, init_value=0):
	self.size = size
	self.array = []
	
	for x in range(self.size.x):
		for y in range(self.size.y):
			self.array.append(init_value)

func get_value(coords: Vector2i, loop: bool=false):
	var x = coords.x
	var y = coords.y
	
	if is_in_range(coords):
		if loop:
			x = x % self.size.x
			y = y % self.size.y
		else:
			return null
	
	return self.array[x + y * self.size.x]

func set_value(coords: Vector2i, value, loop: bool=false) -> bool:
	var x = coords.x
	var y = coords.y
	
	if is_in_range(coords):
		if loop:
			x = x % self.size.x
			y = y % self.size.y
		else:
			return false

	self.array[x + y * self.size.x] = value
	
	return true

func is_in_range(coords: Vector2i) -> bool:
	var x = coords.x
	var y = coords.y
	
	if x < 0 || x >= self.size.x:
		return false
	
	if y < 0 || y >= self.size.y:
		return false
	
	return true
