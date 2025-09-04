extends ParallaxBackground

func _ready():
	$Timer.start()

func _process(delta):
	scroll_offset.x -= 100*delta
	if $Timer.is_stopped():
		scroll_offset.x = 0
		$Timer.start()
