extends Node2D

const ItemSize = Vector2(32, 32)
const ObstacleSize = Vector2(128, 128)

enum Item {
	Gasoline,
	Bucket,
	Bedsheet,
	Toilet,
	Wrench,
	Motor,
	Wheel,
	Fire
}

enum ObstacleType {
	Car
}

static func load_texture_for_item(item):
	var asset = "";
	match item:
		Item.Gasoline:
			asset = "gasoline/Gasoline.png"
		Item.Bucket:
			asset = "bucket/Bucket.png"
		Item.Bedsheet:
			asset = "bed/Bedsheet.png"
		Item.Toilet:
			asset = "wc/wc.png"
		Item.Wrench:
			asset = "wrench/wrench.png"	
		Item.Motor:
			asset = "motor/motor.png"
	return load("res://items/interactables/" + asset)
