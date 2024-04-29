// Inherit the parent event
event_inherited();

minigame = "mg_epic";
grabbed = false;
drawScale = 0;
drawAngle = 0;

draw = function() {
	draw_sprite_ext(sprite_index, image_index, relativeX(), relativeY(), drawScale, drawScale, drawAngle, image_blend, image_alpha);	
}