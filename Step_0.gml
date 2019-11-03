switch (state)
{
	case "move":
	{	#region Move
		if input.right
		{
			sprite_index = Spr_Zero_Running;
			image_xscale = 1;
			move_and_collide(run_speed,0)
			image_speed = walk_speed / 4.5;
		}
		if input.left
		{
			sprite_index = Spr_Zero_Running;
			image_xscale = -1;
			move_and_collide(-run_speed,0)
			image_speed = walk_speed / 4.5;
		}

		if not keyboard_check(vk_right) and not keyboard_check(vk_left)
		{
			sprite_index= Spr_Zero_Idle;
			image_speed = 0.4;
		}
	///Dash	
		if input.dash
		{
			state = "dash";
		}
		if input.attack
		{
			state = "attack one";
		}
		#endregion
	}
		break;
		
	case "dash":
	{	#region Dash
		state_set_sprite(Spr_Zero_Dash, dash_speed / 5, 0);
	
		if image_xscale == 1 
		{
			move_and_collide(dash_speed,0)
		}
	
		if image_xscale == -1 
		{
		
			move_and_collide(-dash_speed,0)	
		
		}
		
		if input.attack and animation_hit_frame_range(1,7)
		{
			state ="dash attack"
		}
		#endregion
	
		break;
	}
	
	case "dash attack":
	{	#region Dash Attack
		state_set_sprite(spr_Zero_Dash_Attack1,dash_attackspeed / 4 ,0);
		
		if image_xscale == 1
		{
			move_and_collide(dash_attackspeed,0)
			
		}
		if image_xscale == -1
		{
			move_and_collide(-dash_attackspeed,0)
		}
		#endregion
		break;
	}
	
	case "attack one":
		#region Attack One
		state_set_sprite(Spr_Zero_Attack1,1.0,0);
		
		if input.attack and animation_hit_frame_range(2,5)
		{
			
			state = "attack two";
		}
		#endregion
		break;
		
	case "attack two":
		#region Attack Two
		state_set_sprite(Spr_Zero_Attack2,1.0,0);
		if input.attack and animation_hit_frame_range(2,5)
		{
			state = "attack three";
		}
		if input.attack and keyboard_check(vk_up) and animation_hit_frame_range(2,5)
		{
			state = "attack four"
		}
		#endregion
		break;
	
	case "attack three":
{		#region Attack Three
		state_set_sprite(Spr_Zero_Attack3,1.0,0);
}
		#endregion
		break;
		
	case "attack four":
		#region Attack Four
	state_set_sprite(Spr_Zero_attack_4,attack_animation_speed / 4 ,0);
	
		#endregion
		break;
vsped = vsped + grav
	case "jump":
		#region Jump
		if input.jump
	{
		if place_meeting(x,y+1,obj_wall)
		{
			vsped = -4
			state_set_sprite(Spr_Zero_Jumping,0.5,0)
			vsped-= grav
			move_and_collide((input.right-input.left)*(run_speed),vsped)
			
		}
	}
		#endregion
		break;
}