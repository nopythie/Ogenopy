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

//Gravite
if (vspeed <= 10)
{
    vspeed += 1
}

//Collision
if (place_meeting(x,y,obj_plateform)) && vspeed >= 0
{
    current_state = stick_states.running
}

//Saut
if (keyboard_check_released(vk_space))
{
    image_index = 0
    current_state = stick_states.jumping
}

//Dash
if (can_dash == true)
{
    if (mouse_check_button_released(mb_left)) {
        image_index = 0
        sprite_index = spr_stick_attack;
        image_speed = 1;
        current_state = stick_states.dashing
    }
}

//Mort
if (place_meeting(x,y+1,obj_wall) ^^ place_meeting(x,y+1,obj_wall_bas)) ^^ (obj_perso.y > 800)
{
    alarm[1]=30
    current_state = stick_states.death
}

