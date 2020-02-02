extends Area2D
class_name obstacle

const World = preload("res://levels/World.gd")

var obstacle_type
var texture
var currentMotor
var currentLevel

func _init(position: Vector2, item):
	self.position = position
	self.obstacle_type = item
	texture = Sprite.new()
	texture.texture = load("res://obstacles/car/car.png")
	var sx = World.ObstacleSize.x / texture.texture.get_size().x
	var sy = World.ObstacleSize.y / texture.texture.get_size().y
	texture.scale = Vector2(sx, sy)
	add_child(texture)

func _physics_process(_delta):
	if currentMotor != null && currentMotor.broken == false:
		position.x -= 5*_delta
	
	var tiles = currentLevel.get_node("ForegroundTiles")
	var mapBounds = calculate_bounds(tiles)
	var obstacleBounds = Rect2(position, World.ObstacleSize)
	if(obstacleBounds.intersects(mapBounds)):
		for i in range(5):
			currentLevel.generate_new_hole()
		get_parent().queue_free()
		
func calculate_bounds(tilemap):
	var cell_bounds = tilemap.get_used_rect()
	var cell_to_pixel = Transform2D(Vector2(tilemap.cell_size.x * tilemap.scale.x, 0), Vector2(0, tilemap.cell_size.y * tilemap.scale.y), Vector2())
	return Rect2(cell_to_pixel * cell_bounds.position, cell_to_pixel * cell_bounds.size)
