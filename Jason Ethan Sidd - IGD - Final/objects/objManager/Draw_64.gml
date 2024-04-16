var numVariables = ds_list_size(trueVariables);
if (numVariables != 0) {
	var ydraw = 30;
	draw_text(30, ydraw, "varibles that are true:");
	ydraw += 10;
	for (var i = 0; i < numVariables; i ++) {
		ydraw += 20;
		draw_text(30, ydraw, "- " + trueVariables[|i]);
	}
}