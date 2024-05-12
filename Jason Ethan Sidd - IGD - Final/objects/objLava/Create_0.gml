// Inherit the parent event
event_inherited();

name = "obj_lava";

onActivate = function() {
	if objManager.isTrue("lava_gone") {
		objRmBasement.sprite_index = sprRmBasementCleared;
	}
}