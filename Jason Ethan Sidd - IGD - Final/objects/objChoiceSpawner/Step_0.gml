if (delay > 0) {
	delay --;
	
	if (delay == 0) {
		if active {
			var availableChoices = ds_list_create();
			for (var i = 0; i < array_length(choices); i ++) {
				var add = true;
				if variable_struct_exists(choices[i], "if_true") {
					add = objManager.isTrue(choices[i].if_true)
				}
				if add {
					ds_list_add(availableChoices, choices[i]);	
				}
			}
			
			var numChoices = ds_list_size(availableChoices);
			var yspawn = y - (numChoices - 1) * (choiceSep / 2);
			
			for (var i = 0; i < numChoices; i ++) {
				var current = availableChoices[|i];
				var choice = instance_create_depth(x, yspawn + (i * choiceSep), depth, objChoice)
				choice.show(current.text);
				if variable_struct_exists(current, "lines") {
					choice.lines = current.lines;
				}
			}
			
			if (numChoices == 0) {
				objManager.doNextThing();	
			}
		} else {
			instance_destroy(objChoice);
			objManager.doNextThing();
		}
	}	
}