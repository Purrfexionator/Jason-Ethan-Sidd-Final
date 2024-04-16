// Inherit the parent event
event_inherited();

name = "obj_key";

visible = false;
onActivate = function() {
	if objManager.isTrue("has_key") {
		instance_destroy();
	}
}