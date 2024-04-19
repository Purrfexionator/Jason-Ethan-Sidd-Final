if active {
	boxPercent = lerp(boxPercent, 1, 0.1);	
} else {
	boxPercent = max(boxPercent - 0.05, 0);
}