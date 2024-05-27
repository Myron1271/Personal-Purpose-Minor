/// @description Insert description here
// You can write your code in this editor

x = objEnemyMockup.x;
y = objEnemyMockup.y;

//show_debug_message("CountDown: " + string(countdown))

var distanceEnemyGunToPlayer = point_distance(x, y, objPlayer.x, objPlayer.y)

if (distanceEnemyGunToPlayer <= 300 && !collision_line(x,y, objPlayer.x, objPlayer.y, [objGround, objGroudSlope], false, false))
{
	image_angle = point_direction(x, y, objPlayer.x, objPlayer.y - 13)
	countdown -= 1;
	if (countdown <= 0) 
	{
		countdown = enemyShootCountdown;
		if (!collision_line(x,y, objPlayer.x, objPlayer.y, [objGround, objGroudSlope], false, false)) 
		{
			
			with (instance_create_layer(x, y, "InstancesBullets", objEnemyBullet))
			{
				speed = 10;
				direction = other.image_angle + random_range(-3, 3);
				image_angle = direction;			
			}
		}
	}	
}
else image_angle = point_direction(x, y, x, y)






