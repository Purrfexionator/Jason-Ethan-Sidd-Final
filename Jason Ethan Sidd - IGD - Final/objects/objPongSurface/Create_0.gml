// Inherit the parent event
event_inherited();

minigame = "mg_epic";
propDepth = 1;

surf = -1;
props = [objPongPlayerPaddle, objPongBall];

draw = function() {
	if !surface_exists(surf) {
		surf = surface_create(frame.sprite_width, frame.sprite_height);
	}
	surface_set_target(surf);
	draw_clear_alpha(c_white, 0);
	gpu_set_fog(true, c_black, 0, 1);
	for (var i = 0; i < array_length(props); i ++) {
		with props[i] {
			draw();	
		}
	}
	gpu_set_fog(false, c_black, 0, 1);
	surface_reset_target()
	
	draw_set_alpha(0.4);
	draw_surface(surf, relativeX() + 8, relativeY() + 8);
	draw_set_alpha(1);
}