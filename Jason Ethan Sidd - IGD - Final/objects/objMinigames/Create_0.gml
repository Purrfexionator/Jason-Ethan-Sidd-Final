boxWidth = 0;
boxHeight = 0;
boxPercent = 0;

active = false;
delay = 0;

caption = new display();
currentFrame = noone;
name = "";
surface = noone;

function play(minigame) {
	with objMinigameFrame {
		if (self.minigame == minigame) {
			other.currentFrame = self;	
		}
	}
	var anchor = noone;
	with objMinigameAnchor {
		if (self.minigame == minigame) {
			anchor = self;	
		}
	}
	
	if (currentFrame != noone && anchor != noone) {
		delay = 20;
		name = minigame;
		
		x = objManager.xTarget;
		y = anchor.y;
		
		currentFrame.mouseXOffset = (currentFrame.x - x);
		currentFrame.mouseYOffset = (currentFrame.y - y);
		
		boxWidth = currentFrame.sprite_width;
		boxHeight = currentFrame.sprite_height;
		surface = surface_create(boxWidth, boxHeight);
		
		return true;
	}
	return false;
}

function hide() {
		active = false;
		caption.hideText(1, 1);
}