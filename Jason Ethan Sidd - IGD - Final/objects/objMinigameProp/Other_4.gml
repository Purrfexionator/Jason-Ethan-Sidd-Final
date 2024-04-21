var reference =  instance_create_depth(x, y, depth, objMinigamePropReference);

reference.minigame = minigame;
reference.propDepth = propDepth;
reference.prop = object_index;

reference.image_xscale = image_xscale;
reference.image_yscale = image_yscale;
reference.image_angle = image_angle;

instance_destroy();