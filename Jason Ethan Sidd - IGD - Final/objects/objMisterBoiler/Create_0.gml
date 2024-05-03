// Inherit the parent event
event_inherited();

name = "obj_mister_boiler";

onActivate = function() {
	if objManager.isTrue("met_wizard") {
		sprite_index = sprBoiler;
	} else {
		sprite_index = sprNone;
	}
}