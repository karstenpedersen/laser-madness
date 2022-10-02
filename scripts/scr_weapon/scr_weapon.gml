
function weapon_player() : weapon_base() constructor {
	cooldown = 30;
	projectiles = [
		new projectile_player(),
	];
}

function weapon_base() constructor {
	cooldown = 10;
	projectiles = [];
}

function projectile_player() : projectile_laser() constructor {
	damage = 5;
	piercing = 3;
	object = obj_projectile_player;
	lifetime = 30;
	range = 500;
}


function projectile_laser() : projectile_base() constructor {
	type = PROJECTILE_TYPE.LASER;
	sprite = spr_projectile_laser;
	range = 100;
	movement_speed = 2;
}

function projectile_base() constructor {
	damage = 1;
	piercing = 3;
	type = PROJECTILE_TYPE.BULLET;
	object = noone;
	lifetime = 100;
	range = -1;
	sprite = spr_projectile_bullet;
	movement_speed = 5;
}

function create_projectile(_x, _y, _projectile, _creator, _angle, _enemy = false) {
	with (instance_create_layer(_x, _y, "Instances", _projectile.object)) {
		sprite_index = _projectile.sprite;
		creator = _creator;
		type = _projectile.type;
		damage = _projectile.damage;
		piercing = _projectile.piercing;
		enemy = _enemy;
		sprite_angle = _angle;
		lifetime = _projectile.lifetime;
		range = _projectile.range;
		movement_speed = _projectile.movement_speed;
	}
}