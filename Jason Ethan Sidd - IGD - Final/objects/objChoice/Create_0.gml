boxWidth = 300;
boxHeight = 50;
boxPercent = 0;
boxColor = c_gray

xWave = 3;
xPercent = random(1);
xRate = 0.012;
yWave = 2;
yPercent = random(1);
yRate = 0.01;

active = false;

caption = new display();
content = new display(480);
lines = -1;

function show(choice) {
	active = true;
	caption.showText("choice you can select", 1);
	content.showText(choice, 0.5);
}

function hide() {
	active = false;
	caption.hideText(1, 1);
	content.hideText(1, 1);
	boxColor = c_gray;
}