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

function showMessage(text, speaker = "You") {
	caption.showText("dialogue box", 1);
	self.speaker.showText(speaker + ":", 1);
	
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

//showMessage("hey guys welcome back to my minecraft video i hope you have fun, remember to like an dsubscribe guys if i get to 500 likes i will build a bomb im my backyard guys im gonna do it guys get ready get hyped", "friendly guy");