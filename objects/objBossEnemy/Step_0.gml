/// @description Insert description here
// You can write your code in this 
var distanceToPlayer = point_distance(x,y, objPlayer.x, objPlayer.y);
show_debug_message("Distance to Player: " + string(distanceToPlayer))

if (distanceToPlayer <= 320)
{
	sprite_index = sprBossAttack
}
else sprite_index = sprBossIdle

if (hp <= 0)
{
	instance_destroy();
	if (!instance_exists(objBossEnemy))
	{
		instance_create_layer(objPowerUpSpawnBigJump.x, objPowerUpSpawnBigJump.y, "InstancesPowerUp", objPowerUpBigJump);		
	}
}