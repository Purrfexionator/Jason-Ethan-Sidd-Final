// Inherit the parent event
event_inherited();

minigame = "mg_cereal";
propDepth = 3;
canGrab = true;
grabbed = false;
drawScale = 1;
drawAngle = 0;
cupTouch = false;

draw = function() {
	draw_sprite_ext(sprite_index, image_index, relativeX(), relativeY(), drawScale, drawScale, drawAngle, image_blend, image_alpha);	
}