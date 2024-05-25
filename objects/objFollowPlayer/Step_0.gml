/// @description Insert description here
// You can write your code in this editor

if (hp <= 0 ) {
	instance_destroy();
}

else {

	var distanceToPlayer = point_distance(x, y, objPlayer.x, objPlayer.y)


	if (distanceToPlayer <= 100 && distanceToPlayer > 5) {
		move_towards_point(objPlayer.x, objPlayer.y, 4.2);
	}
	else {
		speed = 0;
	}
}



//if (point_distance(x,y,objPlayer.x,objPlayer.y) <= 100 && (point_distance(x,y,objPlayer.x,objPlayer.y)) > 20) {
//	move_towards_point(objPlayer.x, objPlayer.y, 3);
//}
//else {
//	speed = 0;
//}

//show_debug_message("Distance to player: " + string(distanceToPlayer))


//Follow's the player
//image_angle = point_direction(x, y, objPlayer.x, objPlayer.y)