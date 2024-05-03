// Inherit the parent event
event_inherited();

name = "obj_raccoon";

onActivate = function() {
	if objManager.isTrue("lava_gone") {
		sprite_index = sprRaccoon;
	} else {
		sprite_index = sprNone;
	}
}