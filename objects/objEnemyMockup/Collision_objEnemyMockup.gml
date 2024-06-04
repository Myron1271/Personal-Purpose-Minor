/// @description Insert description here
// You can write your code in this editor



//var enemyDirection = point_direction(other.x, other.y, x, y);

//xMovePush += lengthdir_x(3, enemyDirection);
//yMovePush += lengthdir_y(3, enemyDirection);


if point_in_rectangle(x, y, 0, 0, room_width, room_height) {
	if x == other.x && y == other.y {
		x += sign(other.id - id);
	}
	var dir = point_direction(other.x, other.y, x, y);
	speed_[h] += lengthdir_x(.1, dir);
	speed_[v] += lengthdir_y(.1, dir);
}
