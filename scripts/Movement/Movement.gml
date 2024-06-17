// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Movement(){
	//Horizontale Collision
	var xMoveCollide = move_and_collide(xMove, 0, [myTileMapCollision, objBossEnemy], abs(xMove))

	// Laat de speler de helling omlaag lopen
	if (onGround) && (place_meeting(x,y + abs(xMove) + 1, [myTileMapCollision, objBossEnemy])) && (yMove >= 0) {
		yMove += abs(xMove) + 2;
	}

	// Verticale Collision
	var yMoveCollide = move_and_collide(0, yMove, [myTileMapCollision, objBossEnemy], abs(yMove) + 1, xMove, yMove, xMove, yMove)
	if (array_length(yMoveCollide) > 0) {
		if (yMove > 0 ) {
			canjump = 10
		}
		yMove = 0
	}
}