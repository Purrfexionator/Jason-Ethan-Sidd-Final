// Inherit the parent event
event_inherited();

name = "obj_apple";

onActivate = function() {
	if objManager.isTrue("has_apple") {
		objKey.visible = true;
		instance_destroy();
	}
}