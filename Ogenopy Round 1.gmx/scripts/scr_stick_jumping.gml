switch(jumps)
{
    case 2:
    sprite_index=spr_stick_jump1; 
    vspeed =-12;
    jumps -= 1;
    current_state = stick_states.falling
    break;
                        
    case 1:
    sprite_index=spr_stick_jump2;  
    vspeed =-12;
    jumps -= 1;
    current_state = stick_states.falling
    break;
    
    case 0:
    current_state = stick_states.falling
    break;
}

if (keyboard_check_released(vk_space))
{
    image_index = 0
    current_state = stick_states.jumping
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


if (place_meeting(x,y,obj_plateform)) && vspeed >= 0
{
    current_state = stick_states.running
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
