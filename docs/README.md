# Changes made to the code

## Spawnflag 8 
If an entity has this spawnflag and a targetname, a HUD element will be drawn when the player is close
enough to the entity. Its purpose is to give visual cue that the entity is usable.

Usually, a button gets activated when the player collides (touches) the brush-entity.
Now, if an entity has the spawnflag 8, the entity will be activated on ```+use``` not on touch.
This works only for ```func_button``` right now.


