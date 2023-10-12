can_dash = false;
hspeed = dash_speed;
vspeed = 0;
if (image_index >= image_number -1){
    image_speed = 0;
}

dash_timer -= 1;

if (dash_timer <= 0) 
{
    hspeed = 0;
    dash_timer = dash_duration;
    image_index = image_number -1
    current_state = stick_states.falling;
}

//Mort
if (place_meeting(x,y+1,obj_wall) ^^ place_meeting(x,y+1,obj_wall_bas)) ^^ (obj_perso.y > 800)
{
    alarm[1]=30
    current_state = stick_states.death
}
