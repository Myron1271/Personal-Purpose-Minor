/// @description Insert description here
// You can write your code in this editor
draw_self()

if (flash > 0) {
	flash -=1;
	shader_set(shWhiteFlash)
	draw_self();
	shader_reset()
}