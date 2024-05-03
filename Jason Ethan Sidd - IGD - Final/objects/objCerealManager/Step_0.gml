switch state {
	case cerealStates.intro:
		if objCerealIntroButton.pressed {
			state = cerealStates.introTransition;
		}
	break;
	case cerealStates.introTransition:
		instance_destroy(objCerealIntroBackground);
		instance_destroy(objCerealIntroBar);
		instance_destroy(objCerealIntroButton);
		state = cerealStates.pour;
	break;
	case cerealStates.pour:
	break;
	case cerealStates.congrats:
		objCerealCongrats.propDepth = 1;
	break;
}