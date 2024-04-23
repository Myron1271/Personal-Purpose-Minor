/// @description Insert description here
// You can write your code in this editor
#region //Get Player Input

if (hascontrol)
{
	keyLeft = keyboard_check(ord("A"));
	keyRight = keyboard_check(ord("D"));
	keyJump = keyboard_check_pressed(vk_space); 

	if (keyLeft) || (keyRight) || (keyJump)
	{
		controller = 0;
	}

	if (abs(gamepad_axis_value(0,gp_axislh)) > 0.2)
	{
		keyLeft = abs(min(gamepad_axis_value(0,gp_axislh),0));
		keyRight = max(gamepad_axis_value(0,gp_axislh),0);
		controller = 1;
	}

	if (gamepad_button_check_pressed(0,gp_face1))
	{
		keyJump = 1;
		controller = 1;
	}
}
else
{
	keyRight = 0;
	keyLeft = 0;
	keyJump = 0;
}

#endregion

#region //Calculate Movement

var move = keyRight - keyLeft;

hsp = (move * walksp);

vsp = (vsp + grv);


//Jumping
canjump-=1;

if (place_meeting(x,y+1,objGround))
{
	canjump = 10;
}

if (canjump > 0) && (keyJump)
{
	vsp = -7;	
}


#endregion

#region //Collide and move
//Horizontal Collision
if (place_meeting(x+hsp,y,objGround))
{
	while (!place_meeting(x+sign(hsp),y,objGround))
	{
		x = x + sign(hsp);
	}
	hsp = 0;
}
x = x + hsp;

//Vertical Collision
if (place_meeting(x,y+vsp,objGround))
{
	while (!place_meeting(x,y+sign(vsp),objGround))
	{
		y = y + sign(vsp);
	}
	vsp = 0;
}
y = y + vsp;
#endregion