activePercent = lerp(activePercent, active, 0.1);
selectedPercent = lerp(selectedPercent, selected, 0.15);

if keyboard_check_pressed(vk_left) {
	active = !active	
}
if keyboard_check_pressed(vk_right) {
	selected = !selected;	
}