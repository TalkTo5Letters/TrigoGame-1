extends PointLight2D

@onready var anim_tree = $AnimationTree
@onready var fog_state = anim_tree.get("parameters/playback")

func fog_in():
	fog_state.travel("fog_in")
	
func fog_out():
	fog_state.travel("fog_out")
	
func fog_idle():
	fog_state.travel("Idle_normal")
