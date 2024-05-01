queuedRoom = -1;
currentRoom = -1;

moving = false;
freeMove = true;
moveDelay = 0;

xTarget = x;
yTarget = y;
yOffset = 0;

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
		yOffset = 0;
		with objPortrait {
			active = false;
			selected = false;
		}
		
		return;
	}
	
	var line = currentLines.next();
	
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
	if variable_struct_exists(line, "set_true") {
		if !isTrue(line.set_true) {
			ds_list_add(variablesToAdd, line.set_true);	
		}
	}
	
	if variable_struct_exists(line, "lines") {
		addLines(line.lines);
	}
	if variable_struct_exists(line, "speaker") {
		objDialogue.currentSpeaker = line.speaker;	
	}

	if variable_struct_exists(line, "portraits") {
		if line.portraits {
			with objPortrait {
				x = other.xTarget;
				y = other.currentRoom.yMid + 400;
				active = true;
			}
			objLeftPortrait.x -= 400;
			objRightPortrait.x += 400;
		} else {
			with objPortrait {
				active = false;
				selected = false;
			}
		}
	}
	if variable_struct_exists(line, "portraitFocus") {
		switch line.portraitFocus {
			case "left":
				objLeftPortrait.selected = true;
				objRightPortrait.selected = false;
				break;
			case "right":
				objLeftPortrait.selected = false;
				objRightPortrait.selected = true;
				break;
			default:
				objLeftPortrait.selected = false;
				objRightPortrait.selected = false;
				break;
		}
	}
	if variable_struct_exists(line, "portraitL") {
		objLeftPortrait.sprite_index = asset_get_index(line.portraitL);
	}
	if variable_struct_exists(line, "portraitLI") {
		objLeftPortrait.image_index = line.portraitLI;
	}
	if variable_struct_exists(line, "portraitR") {
		objRightPortrait.sprite_index = asset_get_index(line.portraitR);
	}
	if variable_struct_exists(line, "portraitRI") {
		objRightPortrait.image_index = line.portraitRI;
	}

	var skipToNext = true;
	
	if variable_struct_exists(line, "text") {
		objDialogue.showMessage(line.text);
		yOffset = 100;
		
		skipToNext = false;
	} else if variable_struct_exists(line, "choices") {
		objDialogue.hide();
		objChoiceSpawner.showChoices(line.choices);
		yOffset = 100;
		
		skipToNext = false;
	} else if variable_struct_exists(line, "minigame") {
		if objMinigames.play(line.minigame) {
			if variable_struct_exists(line, "minigameData") {
				var dataList = line.minigameData;
				for (var i = 0; i < array_length(dataList); i ++) {
					var data = dataList[i];
					objMinigames.currentFrame.setData(data.name, data.value);
				}
			}
			
			objMinigames.win = [line.if_won];
			objMinigames.lose = [line.if_lost];
			objDialogue.hide();
			skipToNext = false;
		}
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

randomize();