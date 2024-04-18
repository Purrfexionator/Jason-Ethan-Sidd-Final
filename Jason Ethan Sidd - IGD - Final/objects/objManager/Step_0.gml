var width = camera_get_view_width(view_camera[0]);
var height = camera_get_view_height(view_camera[0]);

if (moveDelay > 0) {
	moveDelay --;
	if (moveDelay == 0) {
		moving = true;
		currentRoom = queuedRoom;
		queuedRoom = -1;
		if freeMove {
			with objPlayer {
				if active {
					move(other.currentRoom);
				} else {
					active = true;	
				}
			}
		} else {
			objPlayer.active = false;	
		}
	}
}

if moving {
	if freeMove {
		xTarget = objPlayer.x;
		yTarget = objPlayer.y - 32;
	} else  {
		xTarget = currentRoom.xMid;
		yTarget = currentRoom.yMid;
	}
	if (!objPlayer.moving && point_distance(x, y, xTarget, yTarget) <= 4) {
		objDialogue.x = currentRoom.xMid;
		objDialogue.y = currentRoom.yMid + 280;
		objChoiceSpawner.x = currentRoom.xMid;
		objChoiceSpawner.y = currentRoom.yMid + 280;
		
		moving = false;
		addLines(currentRoom.lines);
		doNextThing();
	}
} else if currentRoom != -1 {
	xTarget = currentRoom.xMid;
	yTarget = currentRoom.yMid + yOffset;
}

x = lerp(x, xTarget, 0.1);
y = lerp(y, yTarget, 0.1);
camera_set_view_pos(view_camera[0], x - width / 2, y - height / 2);

if keyboard_check_pressed(vk_f4) {
 window_set_fullscreen(!window_get_fullscreen());	
}