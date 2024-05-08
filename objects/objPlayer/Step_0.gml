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

if (keyboard_check(vk_shift)) {
	sprint = 2
}
else {
	sprint = 1
}

// Check of het 0 of -1 is.
// keyRight = 1 dan is het 1-0 = 1.
// keyLeft = 1 dan is het 0-1 = -1.
var move = keyRight - keyLeft;
// Zat de snelheid van Movement naar walksp
xMove = (move * walksp * sprint);

yMove = (yMove + grv);

//Jumping
canjump-=1;

// Checked of Player op de ground staat
if (place_meeting(x,y+1,objGround))
{
	// Hoe hoger dit getal hoevaker de speler kan "Dubbel Jumpen"
	canjump = 1;
}

// If Player is op de grond en drukt op space, verplaats Speler 7 pixels omhoog
if (canjump > 0) && (keyJump)
{
	if (!yMove > 0) {
		xMove = (move * walksp)
	}
	yMove = -7;
	
}


#endregion

#region //Collide and move
//Horizontal Collision
if (place_meeting(x+xMove,y,objGround))
{
	while (!place_meeting(x+sign(xMove),y,objGround))
	{
		x = x + sign(xMove);
	}
	xMove = 0;
}
x = x + xMove;

//Vertical Collision
if (place_meeting(x,y+yMove,objGround))
{
	while (!place_meeting(x,y+sign(yMove),objGround))
	{
		y = y + sign(yMove);
	}
	yMove = 0;
}
y = y + yMove;
#endregion


#region Animation
var aimside = sign(mouse_x - x)
if (aimside != 0) image_xscale = aimside;

// Dit stukje code later veranderen in een "beter" geschreven stuk
if (!place_meeting(x, y+1, objGround)) {
	// Bepaalt welke Sprite gekozen word
	sprite_index = sprPlayerJumping
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
	} else {
		sprite_index = sprPlayerRunning
		if (aimside != sign(xMove)) { sprite_index = sprPlayerRunningBack}
	}
}

#endregion


