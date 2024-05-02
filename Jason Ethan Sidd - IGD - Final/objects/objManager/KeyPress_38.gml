with objRoom {
	if (name == "rm_bedroom") {
		other.queuedRoom = self;
		ds_stack_clear(other.lineStack);
	}

}