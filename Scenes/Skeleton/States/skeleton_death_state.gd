extends SkeletonState


func _enter(args := {}) -> void:
	._enter(args)
	root.animation_player.play("RESET")
	root.animation_player.play("Death")
	root.animation_player.connect("animation_finished", self, "_on_animation_finished")


func _exit() -> void:
	._exit()
	root.animation_player.disconnect("animation_finished", self, "_on_animation_finished")


func _on_animation_finished(anim_name: String) -> void:
	print("%s is death." % owner.name)
