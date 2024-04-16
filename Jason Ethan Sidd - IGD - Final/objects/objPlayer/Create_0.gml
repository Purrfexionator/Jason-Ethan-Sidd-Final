active = false;
moving = false;
spd = 4;
baseScale = 0;

stretch = 0.05;
stretchPercent = 0;
stretchRate = 0.01;

wiggle = 8;
wigglePercent = 0;
wiggleRate = 0.1;

xTarget = x;
yTarget = y;

function move(targetRoom) {
	xTarget = targetRoom.xMid;
	yTarget = targetRoom.yMid + 32;
	
	speed = 6;
	direction = point_direction(x, y, xTarget, yTarget);
	
	image_yscale = 1;
	stretchPercent = 0;
	
	moving = true;
}