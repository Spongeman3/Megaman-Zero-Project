///@arg xspeed
///@arg yspeed
var xspeed = argument0;
var yspeed = argument1;
if not place_meeting(x+xspeed,y,obj_wall)
{
	x += argument0;
}

if not place_meeting(x,y+yspeed,obj_wall)
{
	y +=yspeed;
}
