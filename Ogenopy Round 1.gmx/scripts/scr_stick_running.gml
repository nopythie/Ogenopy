var inst = (instance_place(x, y-vspeed , obj_plateform))

if (inst != noone) && vspeed >= 0
{ 
    vspeed=0;
    sprite_index=spr_stick_sliding;
    image_speed=.4;
    jumps=2
    can_dash = true;
    if (y >= inst.y - 46)
    {
        y = inst.y - 46
    }
    if !audio_is_playing(snd_grinding)
    {
        audio_play_sound(snd_grinding, 1 , 1)
    }
}
else
{
    if vspeed >= 0
    {
        if audio_is_playing(snd_grinding)
        {
            audio_stop_sound(snd_grinding)
        }
        sprite_index = spr_stick_riding
        current_state = stick_states.falling
    }
}

//Reset Dash
if (x != initial_x)
{
    hspeed -= 0.1
}
else
{
    hspeed = 0
}
if (x <= initial_x)
{
    x = initial_x
    hspeed = 0
}

if (keyboard_check_released(vk_space))
{
    if audio_is_playing(snd_grinding)
    {
        audio_stop_sound(snd_grinding)
    }
    image_index = 0
    current_state = stick_states.jumping
}

if (place_meeting(x,y+1,obj_wall) ^^ place_meeting(x,y+1,obj_wall_bas)) ^^ (obj_perso.y > 800)
{
    if audio_is_playing(snd_grinding)
    {
        audio_stop_sound(snd_grinding)
    }
    alarm[1]=30
    current_state = stick_states.death
}

//Dash
if (can_dash == true)
{
    if (mouse_check_button_released(mb_left)) {
        if audio_is_playing(snd_grinding)
        {
            audio_stop_sound(snd_grinding)
        }
        image_index = 0
        sprite_index = spr_stick_attack;
        image_speed = 1;
        current_state = stick_states.dashing
    }
}
