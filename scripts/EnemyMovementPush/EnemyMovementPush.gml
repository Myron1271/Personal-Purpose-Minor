// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function EnemyMovementPush(){
	//Horizontale Collision
	var xMoveCollide = move_and_collide(xMovePush, 0, [objGround, objGroudSlope], abs(xMovePush))

	// Laat de speler de helling omlaag lopen
	if (onGround) && (place_meeting(x,y + abs(xMovePush) + 1, [objGround, objGroudSlope])) && (yMovePush >= 0) {
		yMovePush += abs(xMovePush) + 2;
	}

	// Verticale Collision
	var yMoveCollide = move_and_collide(0, yMovePush, [objGround, objGroudSlope], abs(yMovePush) + 1, xMovePush, yMovePush, xMovePush, yMovePush)
	if (array_length(yMoveCollide) > 0) {
		if (yMovePush > 0 ) {
			canjump = 10
		}
		yMovePush = 0
	}
}