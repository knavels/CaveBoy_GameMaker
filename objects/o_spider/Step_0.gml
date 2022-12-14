switch (state)
{
	case spider.idle:
		if (instance_exists(o_player))
		{
			var _dis = distance_to_object(o_player);
			if (_dis < sight and alarm[0] <= 0)
			{
				image_speed = 0.5;
				
				if (o_player.x != x)
				{
					image_xscale = sign(o_player.x - x);
				}
			}
		}
		break;
	
	case spider.jump:
		// last image to be shown
		image_index = image_number - 1;
		
		if (!place_meeting(x, y + 1, o_solid))
		{
			yspeed += gravity_acceleration;
		}
		else
		{
			yspeed = 0;
			apply_friction(self, acceleration);
			if (xspeed == 0 and yspeed = 0)
			{
				state = spider.idle;
				alarm[0] = 15;
				image_speed = 0;
				image_index = 0;
			}
		}
		
		if (xspeed != 0)
		{
			image_xscale = sign(xspeed);
		}
		move_actor(self, o_solid);
		break;
}