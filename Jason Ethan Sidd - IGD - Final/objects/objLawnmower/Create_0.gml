// Inherit the parent event
event_inherited();

name = "obj_lawnmower";

onActivate = function() {
	if objManager.isTrue("lava_gone") {
		sprite_index = sprLawnMower;
	} else {
		sprite_index = sprNone;
	}
}