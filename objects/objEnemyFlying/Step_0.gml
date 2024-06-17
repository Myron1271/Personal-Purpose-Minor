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





if (hp <= 0 ) 
{
	instance_destroy();
	if (!instance_exists(objEnemyFlying))
	{
		instance_create_layer(objPowerUpSpawnCrouch.x, objPowerUpSpawnCrouch.y, "InstancesPowerUp", objPowerUp);
	}
}

//show_debug_message("Powerup Spawned value: " + string(powerUpSpawned))

var distanceToPlayer = point_distance(x,y, objPlayer.x, objPlayer.y);
var withinSight = !collision_line(x,y, objPlayer.x, objPlayer.y, myTileMapCollision, false, false)

if ((distanceToPlayer <= 400 && withinSight) || enemyAggro)
{
	if instance_exists(objPlayer) 
	{
		var dir = point_direction(x, y, objPlayer.x, objPlayer.y - 125);
		speed_[h] += lengthdir_x(acceleration_, dir);
		speed_[v] += lengthdir_y(acceleration_, dir);
		if point_distance(0, 0, speed_[h], speed_[v]) > max_speed_ 
		{
			var move_dir = point_direction(0, 0, speed_[h], speed_[v]);
			speed_[h] = lengthdir_x(max_speed_, move_dir);
			speed_[v] = lengthdir_y(max_speed_, move_dir);
		}
	}
	EnemyFlightMovement(speed_, 1);
}

if (distanceToPlayer <= 400)
{
	enemyAggro = false;
}


////OLD CODE

//if (!place_meeting(x,y, objEnemyMockup)) 
//{
//	xMovePush = lerp(xMovePush, 0, .10);
//	yMovePush = lerp(yMovePush, 0, .10);
//}



//var dir = point_direction(x, y, objPlayer.x, objPlayer.y - 150);

//var distanceToPlayer = point_distance(x,y, objPlayer.x, objPlayer.y);

//var withinSight = !collision_line(x,y, objPlayer.x, objPlayer.y, [objGround, objGroudSlope], false, false)

//if (distanceToPlayer <= 300 && distanceToPlayer > 50 && withinSight) 
//{
//	xMove = lengthdir_x(enemySpeed, dir);
//	yMove = lengthdir_y(enemySpeed, dir);
//	Movement(xMove, yMove);
//}
//else speed = 0;


//show_debug_message("Distance To Player: " + string(distanceToPlayer))