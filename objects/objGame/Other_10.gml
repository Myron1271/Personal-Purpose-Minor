/// @description Insert description here
// You can write your code in this editor
if (inCave)
{
	audio_sound_gain(soRain, 0, 2000);
	audio_sound_gain(soCave, volCave, 2000);
}
else
{
	audio_sound_gain(soCave, 0, 2000);
	audio_sound_gain(soRain, volRain, 2000);
}