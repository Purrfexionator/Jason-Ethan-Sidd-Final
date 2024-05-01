// Inherit the parent event
event_inherited();

minigame = "mg_epic";

image_alpha = 0;
active = false;
yDraw = y;
wavePercent = 0;
drawScale = 1;

function show(sprite, fade) {
	if !active {
		active = true;
		if !fade {
			image_alpha = 1;	
		}
	} else {
		drawScale = 1.1;	
	}
	sprite_index = sprite;
}

function hide() {
	active = false;
}

draw = function() {
	draw_sprite_ext(sprite_index, image_index, relativeX(), yDraw, drawScale, drawScale, image_angle, image_blend, image_alpha);
}