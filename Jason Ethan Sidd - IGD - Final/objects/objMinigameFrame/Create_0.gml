minigame = "mg_test";
mouseXOffset = 0;
mouseYOffset = 0;

function drawMinigame() {
	with objMinigameProp {
		if frame == other {
			draw();
		}
	}
}