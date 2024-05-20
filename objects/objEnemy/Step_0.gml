/// @description Insert description here
// You can write your code in this editor

var dir = point_direction(x, y, objPlayer.x, objPlayer.y);

xMove = lengthdir_x(enemySpeed, dir);
yMove= lengthdir_y(enemySpeed, dir);

Movement();
