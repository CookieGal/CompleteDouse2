if instance_exists(obj_shell)
{
	if obj_shell.isOpen
		exit;
}

if instance_exists(obj_keyconfig)
{
	inputbuffer = 2
	exit;
}

if room == mainmenu
	exit;

if (keyboard_check_pressed(vk_escape))
{
	if !pause
		pause = false
	else
		pause = false
}
