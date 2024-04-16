function display(len = 500) constructor {
	queuedText = "";
	currentText = "";
	length = len;
	index = 1;
	charRate = 0;
	counter = 0;
	appear = true;
	complete = false;
	
	function showText(text, rate) {
		appear = true;
		queuedText = text;
		currentText = "";
		index = 1;
		charRate = rate
		complete = string_length(text) <= 0;
		
		//add line breaks
		var spaceIndex = 1;
		var nextSpaceIndex = 0;
		var lineIndex = 0;
		
		while (spaceIndex != 0) {
			nextSpaceIndex = string_pos_ext(" ", queuedText, spaceIndex + 1);
			var test = string_copy(queuedText, lineIndex, nextSpaceIndex - lineIndex);
			if (string_width(test) > length) {
				queuedText = string_delete(queuedText, spaceIndex, 1);
				queuedText = string_insert("\n", queuedText, spaceIndex);
				lineIndex = spaceIndex;
			}
			spaceIndex = nextSpaceIndex;
		}
	}
	
	function hideText(time, rate) {
		appear = false;
		index = string_length(currentText);
		charRate = rate;
		complete = string_length(currentText) == 0;
	}
	
	function reveal() {
		appear = true;
		currentText = queuedText;
		complete = true;
	}
	
	function clear() {
		appear = false;
		currentText = "";
		complete = true;
	}
	
	function update() {
		if !complete {
			counter += charRate;
			var iterations = 0;
			if (counter >= 1) {
				iterations = floor(counter);
				counter -= iterations;
			}
			
			repeat(iterations) {
				if appear {
					var char = string_char_at(queuedText, index)
					currentText = string_concat(currentText, char)
					index ++;
					if (index > string_length(queuedText)) {
						complete = true;
					}
				} else {
					currentText = string_delete(currentText, index, 1);
					index --;
					if (index < 0) {
						complete = true;	
					}
				}
			}
		}
	}
}