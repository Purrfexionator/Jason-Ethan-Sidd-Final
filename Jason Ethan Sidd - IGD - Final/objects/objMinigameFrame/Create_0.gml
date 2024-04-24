minigame = "mg_test";
mouseXOffset = 0;
mouseYOffset = 0;

propList = ds_list_create();

function drawMinigame() {
	for (var i = 0; i < ds_list_size(propList); i ++) {
		var current = propList[|i]
		if instance_exists(current) {
			current.draw();	
		} else {
			ds_list_delete(propList, i);
			i --;
		}
	}
}

function startMinigame() {
	with objMinigamePropReference {
		if (minigame == other.minigame) {
			var newProp = other.addProp(x, y, propDepth, prop);
			newProp.image_xscale = image_xscale;
			newProp.image_yscale = image_yscale;
			newProp.image_angle = image_angle;
		}
	}
	with objMinigameProp {
		onMinigameStart();	
	}
}

function addProp(xpos, ypos, propDepth, prop) {
	var determined = false;
	var index = 0;
	while !determined {
		if (index > ds_list_size(propList)) {
			determined = true;	
		} else {
			var current = propList[|index];
			if (current != undefined && instance_exists(current)) {
				if (current.propDepth < propDepth) {
					determined = true;	
				}
			}
			if !determined {
				index ++;	
			}
		}
	}
	var newProp = instance_create_depth(xpos, ypos, depth, prop);
	newProp.propDepth = propDepth;
	newProp.frame = self;
	if (index < ds_list_size(propList))	
		ds_list_insert(propList, index, newProp);
	else
		ds_list_add(propList, newProp);
	return newProp;
}