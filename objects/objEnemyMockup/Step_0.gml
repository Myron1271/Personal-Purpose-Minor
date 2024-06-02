/// @description Insert description here
// You can write your code in this editor


//var enemyDirection = point_direction(x, y, objPlayer.x, objPlayer.y); //- 100);
//var distanceToPlayer = point_direction(x, y, objPlayer.x, objPlayer.y);
//var withInSight = !collision_line(x,y, objPlayer.x, objPlayer.y, [objGround, objGroudSlope], false, false);

//if (distanceToPlayer <= 250 && distanceToPlayer > 50 && withInSight) 
//{
//	xMove = lengthdir_x(enemySpeed, enemyDirection);
//	yMove = lengthdir_y(enemySpeed, enemyDirection);
//	Movement()
//	//EnemyMovementPush();
	
//	//if (!place_meeting(x,y, objEnemyMockup)) 
//	//{
//	//	xMovePush = lerp(xMovePush, 0, .10);
//	//	yMovePush = lerp(yMovePush, 0, .10);
//	//}
//}
//else speed = 0;


if (!place_meeting(x,y, objEnemyMockup)) 
{
	xMovePush = lerp(xMovePush, 0, .10);
	yMovePush = lerp(yMovePush, 0, .10);
}


//OLD CODE
var dir = point_direction(x, y, objPlayer.x, objPlayer.y - 150);

var distanceToPlayer = point_distance(x,y, objPlayer.x, objPlayer.y);

var withinSight = !collision_line(x,y, objPlayer.x, objPlayer.y, [objGround, objGroudSlope], false, false)

if (distanceToPlayer <= 300 && distanceToPlayer > 50 && withinSight) 
{
	xMove = lengthdir_x(enemySpeed, dir);
	yMove = lengthdir_y(enemySpeed, dir);
	Movement();
	EnemyMovementPush()
}
else speed = 0;


show_debug_message("Distance To Player: " + string(distanceToPlayer))


if (hp <= 0 ) {
	instance_destroy();
}