with objRoom {
	if (name == "rm_living_room") {
		other.queuedRoom = self;
		ds_stack_clear(other.lineStack);
	}

}