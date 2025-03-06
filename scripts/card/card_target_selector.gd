extends Node2D

const ARROW_POINTS := 8

@onready var collide_detector: Area2D = $Area2D
@onready var arrow : Line2D = $CanvasLayer/SelectorArrow

var card: CardUI
var is_selecting := false

func _ready() -> void:
	EventBus.card_aim_started.connect(_on_aim_begin)
	EventBus.card_aim_ended.connect(_on_aim_end)


func _process(delta: float) -> void:
	if not is_selecting:
		return

	collide_detector.position = get_local_mouse_position()
	arrow.points = generate_points()

func generate_points() -> Array:
	var points := []
	var start_point := card.global_position
	start_point.x += (card.size.x / 2)
	var target_point = get_local_mouse_position()
	var distance :Vector2 = (target_point - start_point)

	for i in range(ARROW_POINTS):
		var t := (1.0 / ARROW_POINTS) * i
		var x := start_point.x + (distance.x / ARROW_POINTS) * i
		var y := start_point.y + ease_out_cubic(t) * distance.y
		points.append(Vector2(x, y))

	points.append(target_point)
	return points

func ease_out_cubic(t : float) -> float:
	return 1.0 - pow(1.0 - t, 3.0)

func _on_aim_begin(_card: CardUI) -> void:
	if not _card.config.is_single_targeted():
		return

	is_selecting = true
	collide_detector.monitorable = true
	collide_detector.monitoring = true
	card = _card

func _on_aim_end(_card: CardUI) -> void:
	is_selecting = false
	arrow.clear_points()
	collide_detector.monitorable = false
	collide_detector.monitoring = false
	card = null


func _on_area_2d_area_entered(area: Area2D) -> void:
	if not card or not is_selecting:
		return

	if not card.collide_objects.has(area):
		card.collide_objects.append(area)


func _on_area_2d_area_exited(area: Area2D) -> void:
	if not card or not is_selecting:
		return

	card.collide_objects.erase(area)
