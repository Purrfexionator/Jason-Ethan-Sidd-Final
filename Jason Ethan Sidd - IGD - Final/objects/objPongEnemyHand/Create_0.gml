// Inherit the parent event
event_inherited();

minigame = "mg_epic";
propDepth = -1;

drawScale = 1;

draw = function() {
	draw_sprite_ext(sprite_index, image_index, relativeX(), relativeY(), drawScale, drawScale, image_angle, image_blend, image_alpha);
}