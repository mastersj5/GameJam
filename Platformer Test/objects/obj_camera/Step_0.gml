x = round(clamp(x,(following.x) - h_border, (following.x) + h_border));
y = round(clamp(y,(following.y) - v_border, (following.y) + v_border));

if global.shadow_control
{
	following = obj_blob
}
if !global.shadow_control
{
	following = obj_player
}