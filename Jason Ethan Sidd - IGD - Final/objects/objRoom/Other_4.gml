if variable_struct_exists(objManager.data, name) {
	var myData = variable_struct_get(objManager.data, name);
	freeMove = myData.free_move;
	if variable_struct_exists(myData, "lines") {
		lines = myData.lines;
	}
	if variable_struct_exists(myData, "interactables") {
		var interactables = myData.interactables;
		with objInteractable {
			if ((rm == -1 || rm == other.name) && variable_struct_exists(interactables, name)) {
				lines = variable_struct_get(interactables, name).lines;
				rm = other;
			}
		}
	}
}