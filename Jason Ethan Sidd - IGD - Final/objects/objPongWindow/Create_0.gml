// Inherit the parent event
event_inherited();

minigame = "mg_epic";
propDepth = -1;

drawScale = 0;
active = false;

function show(sprite) {
	sprite_index = sprite;
	active = true;
}

function hide() {
	active = false;	
}

draw = function() {
	if (drawScale >= 0.05) {
		draw_sprite_ext(sprite_index, image_index, relativeX(), relativeY(), drawScale, drawScale, image_angle, image_blend, image_alpha);
	}
}