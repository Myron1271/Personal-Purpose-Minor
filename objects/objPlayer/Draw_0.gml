/// @description Insert description here
// You can write your code in this editor
draw_self()
var crosshairDirection = point_direction(x, y, mouse_x, mouse_y)
var spriteDirection = (mouse_x > x) * 2 - 1;

//draw_sprite_ext(sprPlayerStanding, 0, x, y, spriteDirection, 1, 0, image_blend, image_alpha);
draw_sprite_ext(sprPlayerGun, 0, x - 5 * spriteDirection, y + 3, 1, spriteDirection, crosshairDirection, image_blend, image_alpha);
