/// @description Insert description here
// You can write your code in this editor

//HP is 0 Player is gameover
if (hp <= 0 ) {
	hascontrol = false;
	instance_destroy();
}

var playerCheckGround = place_meeting(x, y+1, [objGround, objGroudSlope])

//Movement
#region
// Hascontrol = true dan maak VARS aan voor movment
// Kan gebruikt worden voor transitions / animaties wanneer de Player niet mag bewegen
if (hascontrol)
{
	//De VARS worden == 1 als A, D, of Space ingedurkt wordt, zo niet dan zijn ze == 0
	keyLeft = keyboard_check(ord("A"));
	keyRight = keyboard_check(ord("D"));
	keySlowWalk = keyboard_check(vk_alt)
	keySprint = keyboard_check(vk_shift);
	keyJump = keyboard_check_pressed(vk_space); 
}
else
{
	//Hascontrol is false dan is movement 0 en kan de speler niet meer bewegen
	keyRight = 0;
	keyLeft = 0;
	keyJump = 0;
}
#endregion


#region //Bereken de Movement

// Check of het 0 of -1 is.
// keyRight = 1 dan is het 1-0 = 1.
// keyLeft = 1 dan is het 0-1 = -1.
var move = keyRight - keyLeft;

// Zet de snelheid van Movement naar playerSpeed
xMove = (move * playerSpeed);


// Zet de zwaarte van de verticale Movement
yMove = (yMove + grv);

// Staat de speler op de grond?
onGround = playerCheckGround

// If Player is op de grond en drukt op space, verplaats Speler 7 pixels omhoog
if (canjump > 0) && (keyJump)
{
    yMove = jumpSpeed; // Jumpspeed = -7
    canjump = 0;
}
#endregion

#region //Collide and Movement op hellingen
	Movement(xMove, yMove);
#endregion

#region Animatie van de Player Movement
var aimside = sign(mouse_x - x)
if (aimside != 0) image_xscale = aimside;

// Wanneer de Player shift inhoudt verhoog de playerSpeed met 0.005 als de playerSpeed 10 heeft bereikt stop dan met snelheid toevoegen
if (keySprint) {
	for (var i = 0; i < playerSprintSpeed; i++) {
		playerSpeed += 0.005;
		if (playerSpeed > playerSprintSpeed) {
			playerSpeed = playerSprintSpeed
			break;
		}
	}
}
// Wanneer de Player stopt met sprinten zet de playerSpeed terug naar 4
else {
	playerSpeed = 4;
}

// Als Player shift inhoudt en loopt achteruit verhoog de Player Speed naar 6
if (keySprint && aimside != sign(xMove)) {
	for (var i = 0; i < playerSprintSpeed; i++) {
		playerSpeed += 0.001;
		if (playerSpeed > playerSprintBackwardsSpeed) {
			playerSpeed = playerSprintBackwardsSpeed
			break;
		}
	}
}

if (keySlowWalk) {
	playerSpeed = playerWalkSpeed;
}

// Dit stukje code later veranderen in een "beter" geschreven stuk
if (!playerCheckGround) {
	// Bepaalt welke Sprite gekozen word
	sprite_index = sprPlayerJumping
	if (keySprint && playerSpeed > playerSprintBackwardsSpeed) {
	} else playerSpeed = 4
	// Snelheid tussen de getekende frames
	image_speed = 0;
	if (sign(yMove) > 0) {
		// Bepaalt welk frame in de sprite gekozen wordt
		// Frame van sprite wanneer die in de lucht is
		image_index = 0;
	} else {
		image_index = 1;
	}
} 
else {
	image_speed = 1;
	if (xMove == 0) {
		//Bug fixen met juisten sprite als je stil staat
		sprite_index = sprPlayerStanding
	} 
	else if (playerSpeed > 7) {
		sprite_index = sprPlayerSprinting
	}
	else if (playerSpeed == 2 && aimside = sign(xMove)) {
		sprite_index = sprPlayerWalking
	}
	else if (playerSpeed == playerWalkSpeed && aimside != sign(xMove)) {
		sprite_index = sprPlayerWalkingBack;
	}	
	else {
		sprite_index = sprPlayerRunning;
			if (aimside != sign(xMove)) {
				sprite_index = sprPlayerRunningBack
		 }
	}
}
#endregion


