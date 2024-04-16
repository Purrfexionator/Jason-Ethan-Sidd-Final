name = "obj_test"
rm = -1;
lines = -1;

active = false;
onActivate = function() {}
nameDisplay = new display();
nameRate = 0.5;
drawScale = 0;

wiggle = 6;
wigglePercent = random(1);
wiggleRate = 0.02;

wave = 2;
wavePercent = random(1);
waveRate = 0.01;

function show() {
	active = true;
	nameDisplay.showText(name, nameRate);	
	onActivate();
}

function hide() {
	active = false;
	nameDisplay.hideText(name, nameRate);
}