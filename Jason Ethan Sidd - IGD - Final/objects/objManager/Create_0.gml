queuedRoom = -1;
currentRoom = -1;
dialogue = false;

moving = false;
freeMove = true;
moveDelay = 0;

xTarget = x;
yTarget = y;

trueVariables = ds_list_create();
variablesToAdd = ds_list_create();

function isTrue(variable) {
	return ds_list_find_index(trueVariables, variable) != -1;	
}

lineStack = ds_stack_create();

function lineReader(lines) constructor {
	self.lines = lines;
	index = 0;
	
	function next() {
		var line = lines[index];
		index ++;
		return line;
	}
	
	function hasNext() {
		return index < array_length(lines);	
	}
}

function addLines(lines) {
	var reader = new lineReader(lines);
	ds_stack_push(lineStack, reader);
}

function doNextThing() {
	var currentLines = ds_stack_top(lineStack);
	while (currentLines != undefined && !currentLines.hasNext()) {
		ds_stack_pop(lineStack);
		currentLines = ds_stack_top(lineStack);
	}
	
	if ds_stack_empty(lineStack) {
		for (var i = 0; i < ds_list_size(variablesToAdd); i ++) {
			ds_list_add(trueVariables, variablesToAdd[|i]);	
		}
		ds_list_clear(variablesToAdd);
		
		show_debug_message(queuedRoom);
		if (queuedRoom == -1) {
			with objInteractable {
				if (rm == other.currentRoom) {
					show();	
				}
			}
		} else {
			moveDelay = (objDialogue.active || objChoiceSpawner.active ? 25 : 1);
			freeMove = queuedRoom.freeMove;
		}
		
		objDialogue.hide();
		with objChoice {
			hide();
		}
		objChoiceSpawner.active = false;
		dialogue = false;
		
		return;
	}
	
	var line = currentLines.next();
	
	if variable_struct_exists(line, "set_true") {
		if !isTrue(line.set_true) {
			ds_list_add(variablesToAdd, line.set_true);	
		}
	}
	if variable_struct_exists(line, "if_true") {
		if !isTrue(line.if_true) {
			doNextThing();
			return;
		}
	}
	if variable_struct_exists(line, "if_false") {
		if isTrue(line.if_false) {
			doNextThing();
			return;
		}
	}
	
	var skipToNext = true;
	
	if variable_struct_exists(line, "lines") {
		addLines(line.lines);
	}
	if variable_struct_exists(line, "text") {
		var text = line.text;

		var speaker = "You";
		if variable_struct_exists(line, "speaker") {
			speaker = line.speaker;	
		}
		
		objDialogue.showMessage(text, speaker);
		dialogue = true;
		
		skipToNext = false;
	} else if variable_struct_exists(line, "choices") {
		objDialogue.hide();
		var choices = line.choices;
		objChoiceSpawner.showChoices(choices);
		dialogue = true;
		
		skipToNext = false;
	}
	if variable_struct_exists(line, "goto") {
		with objRoom {
			if (name == line.goto) {
				other.queuedRoom = self;
				ds_stack_clear(other.lineStack);
				
				skipToNext = false;
			}
		}
	}
	
	if skipToNext {
		doNextThing();	
	}
}

file = file_text_open_read("mystery.json");
fileStr = "";
while (!file_text_eof(file)) {
	fileStr += file_text_readln(file);
}
data = json_parse(fileStr);