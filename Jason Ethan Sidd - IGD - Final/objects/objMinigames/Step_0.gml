if (delay > 0) {
	delay --;
	if (delay == 0) {
		if played {
			instance_destroy(objMinigameProp);
			objManager.doNextThing();
		} else {
			objManager.yOffset = y - objManager.yTarget;
			active = true;
			played = true;
			currentFrame.startMinigame();
			caption.showText(name, 1);
		}
	}
}

if active {
	boxPercent = lerp(boxPercent, 1, 0.1);	
} else {
	boxPercent = max(boxPercent - 0.05, 0);
}