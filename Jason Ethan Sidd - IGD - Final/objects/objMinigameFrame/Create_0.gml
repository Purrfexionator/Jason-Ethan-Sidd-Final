minigame = "mg_test";
mouseXOffset = 0;
mouseYOffset = 0;

function drawMinigame() {
	with objMinigameProp {
		if frame == other {
			draw(x - other.bbox_left, y - other.bbox_top);
		}
	}
}