/// @description Insert description here
// You can write your code in this editor
var spriteDirection = (mouse_x > x) * 2 - 1

x = objPlayer.x - 5 * spriteDirection;
y = objPlayer.y-15;

// Richt de gun Sprite naar de plek waar de muis op het scherm is
image_angle = point_direction(x, y, mouse_x, mouse_y);

firingDelay = firingDelay - 1;
recoil = max(0, recoil - 1);

if (mouse_check_button(mb_left)) && (firingDelay < 0) {	
	recoil = 2;
	firingDelay = 8;
	with (instance_create_layer(x, y, "InstancesBullets", objBullet)) {
		speed = 15;
		direction = other.image_angle + random_range(-2, 2);
		image_angle = direction;
	}
}

x = x - lengthdir_x(recoil, image_angle);
y = y - lengthdir_y(recoil, image_angle);

if (image_angle > 90) && (image_angle < 270) {
	image_yscale = -1;
}
else {
	image_yscale = 1;
}