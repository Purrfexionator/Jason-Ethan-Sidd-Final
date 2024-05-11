switch state {
	case cerealStates.intro:
		if objCerealIntroButton.pressed {
			switchState(cerealStates.pour);
		}
		break;
	case cerealStates.pour:
		if !stateInit {
			instance_destroy(objCerealIntroBackground);
			instance_destroy(objCerealIntroBar);
			instance_destroy(objCerealIntroButton);
			stateInit = true;
		}
		break;
	case cerealStates.congrats:
		if !stateInit {
			objCerealCongrats.image_speed = 1;
			stateInit = true;
		}
		counter ++;
		if (counter == 200) {
			endMinigame(true);	
		}
		break;
}