boxWidth = 500;
boxHeight = 200;
boxPercent = 0;

arrowWave = 3;
arrowPercent = 0;
arrowRate = 0.02;

active = false;

caption = new display();
speaker = new display();
content = new display(480);

currentSpeaker = "";

function showMessage(text) {
	caption.showText("dialogue box", 1);
	if currentSpeaker != "" {
	self.speaker.showText(currentSpeaker + ":", 1);
	}
	
	if active {
		caption.reveal();
		self.speaker.reveal();
	} else {
		active = true;	
	}
	
	content.showText(text, 0.7);
}

function hide() {
		active = false;
		caption.hideText(1, 1);
		speaker.hideText(1, 1);
		content.clear();
}