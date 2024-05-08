/// @description Insert description here
// You can write your code in this editor

//Movement
#region

// Hascontrol = true dan maak VARS aan voor movment
// Kan gebruikt worden voor transitions / animaties wanneer de Player niet mag bewegen
if (hascontrol)
{
	//De VARS worden == 1 als A, D, of Space ingedurkt wordt, zo niet dan zijn ze == 0
	keyLeft = keyboard_check(ord("A"));
	keyRight = keyboard_check(ord("D"));
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

// Zet de snelheid van Movement naar walksp
xMove = (move * walksp);


// Zet de zwaarte van de verticale Movement
yMove = (yMove + grv);

// Staat de speler op de grond?
onGround = place_meeting(x, y+1, [objGround, objGroudSlope])

// If Player is op de grond en drukt op space, verplaats Speler 7 pixels omhoog
if (canjump > 0) && (keyJump)
{
    yMove = jumpSpeed; // Jumpspeed = -7
    canjump = 0;
}
#endregion

#region //Collide and Movement op hellingen

//Horizontale Collision
var xMoveColide = move_and_collide(xMove, 0, [objGround, objGroudSlope], abs(xMove))

// Laat de speler de helling omlaag lopen
if (onGround) && (place_meeting(x,y + abs(xMove) + 1, [objGround, objGroudSlope])) && (yMove >= 0) {
	yMove += abs(xMove) + 2;
}

// Verticale Collision
var yMoveColide = move_and_collide(0, yMove, [objGround, objGroudSlope], abs(yMove) + 1, xMove, yMove, xMove, yMove)
if (array_length(yMoveColide) > 0) {
	if (yMove > 0 ) {
		canjump = 10
	}
	yMove = 0
}
#endregion

#region Animatie van de Player Movement
var aimside = sign(mouse_x - x)
if (aimside != 0) image_xscale = aimside;

if (keySprint) {
	for (var i = 0; i < 10; i++) {
		walksp += 0.01;
		if (walksp > 10) {
			walksp = 10
			break;
		}
	}
}
else {
	walksp = 4;
}

// Dit stukje code later veranderen in een "beter" geschreven stuk
if (!place_meeting(x, y+1, [objGround, objGroudSlope])) {
	// Bepaalt welke Sprite gekozen word
	sprite_index = sprPlayerJumping
	if (keySprint && walksp > 5) {
	} else walksp = 4
	// Snelheid tussen de getekende frames
	image_speed = 0;
	if (sign(yMove) > 0) {
		// Bepaalt welk frame in de sprite gekozen wordt
		// Frame van sprite wanneer die in de lucht is
		image_index = 0;
	} else {
		image_index = 1;
	}
} else {
	image_speed = 1;
	if (xMove == 0) {
		sprite_index = sprPlayerStanding
	} else if (walksp > 7) {
		sprite_index = sprPlayerSprinting
	} else sprite_index = sprPlayerRunning;
		if (aimside != sign(xMove)) {
			sprite_index = sprPlayerRunningBack
			walksp = 4;
		}
}
#endregion


