switch (state)
{
	case snake.move_right:
		var _wall_at_right = place_meeting(x + 1, y, o_solid);
		var _ledge_at_right = !position_meeting(bbox_right + 1, bbox_bottom + 1, o_solid);
		if (_wall_at_right or _ledge_at_right) state = snake.move_left;
		
		image_xscale = 1;
		x += 1;
		break;
	
	case snake.move_left:
		var _wall_at_left = place_meeting(x - 1, y, o_solid);
		var _ledge_at_left = !position_meeting(bbox_left - 1, bbox_bottom + 1, o_solid);
		if (_wall_at_left or _ledge_at_left) state = snake.move_right;
		
		image_xscale = -1;
		x -= 1;
		break;
}