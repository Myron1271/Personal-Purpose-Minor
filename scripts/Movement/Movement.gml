// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Movement(){
	//Horizontale Collision
	var xMoveColide = move_and_collide(xMove, 0, [objGround, objGroudSlope], abs(xMove))

	// Laat de speler de helling omlaag lopen
	if (onGround) && (place_meeting(x,y + abs(xMove) + 1, [objGround, objGroudSlope])) && (yMove >= 0) {
		yMove += abs(xMove) + 2;
	}

	// Verticale Collision
	var yMoveColide = move_and_collide(0, yMove, [objGround, objGroudSlope], abs(yMove) + 1, xMove, yMove, xMove, yMove)
	if (array_length(yMoveColide) > 0) {
		if (yMove > 0 ) {
			canjump = 10
		}
		yMove = 0
	}
}