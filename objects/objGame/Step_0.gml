/// @description Insert description here
// You can write your code in this editor
var playerCollideSoundBaries = false;

with (objPlayer)
{
	playerCollideSoundBaries = place_meeting(x,y, objPlayCaveSound);
}

if (playerCollideSoundBaries)
{
	inCave = true;
	event_user(0)
}
else
{
	inCave = false;
	event_user(0);
}
