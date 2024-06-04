/// @description Insert description here
// You can write your code in this editor

with (other) {
	hp -=1;
	//hp--;
	flash = 3;
	show_debug_message("Enemy HP: " + string(hp))
	var dir = other.direction;
	speed_[h] = lengthdir_x(8, dir);
	speed_[v] = lengthdir_y(8, dir);
		
}

instance_destroy()