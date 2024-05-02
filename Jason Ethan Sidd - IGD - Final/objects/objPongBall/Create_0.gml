// Inherit the parent event
event_inherited();

minigame = "mg_epic";

active = true;
drawScale = 0;
drawAngle = 0;
show_debug_message("IM HERE");

moving = false;
xspd = 0;
yspd = 0;

function launch(spd, xDir, yDir) {
	var angle = random_range(35, 65);
	xspd = lengthdir_x(spd, angle) * xDir;
	yspd = lengthdir_y(spd, angle) * -yDir;
	moving = true;
}

draw = function() {
	draw_sprite_ext(sprite_index, image_index, relativeX(), relativeY(), drawScale, drawScale, drawAngle, image_blend, image_alpha);
}