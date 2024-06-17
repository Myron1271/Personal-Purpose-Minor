/// @description Insert description here
// You can write your code in this editor
audio_play_sound(soRain, 0, 1);
audio_play_sound(soCave, 0, 1);
volCave = audio_sound_get_gain(soCave);
volRain = audio_sound_get_gain(soRain);

audio_sound_gain(soCave, 0, 0)