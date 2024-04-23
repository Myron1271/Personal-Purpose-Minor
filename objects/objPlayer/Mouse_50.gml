/// @description Insert description here
// You can write your code in this editor
if (!shootingCooldown) {

	var dir = point_direction(x, y, mouse_x, mouse_y);
	var xSpriteDir = (mouse_x >  x) * 2 - 1;
	var xGunDir = x - 5 * xSpriteDir;
	var xOffset = lengthdir_x(20, dir)
	var yOffset = lengthdir_y(20, dir)

	instance_create_layer(xGunDir + xOffset, y + yOffset, "Instances", objBullet);
	shootingCooldown = true
	alarm[0] = 15;
}