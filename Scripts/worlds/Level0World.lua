dofile( "$SURVIVAL_DATA/Scripts/game/worlds/BaseWorld.lua")

Level0World = class( BaseWorld )
Level0World.terrainScript = "$CONTENT_DATA/Scripts/terrain/blueprints_level0.lua" -- fix later lol
Level0World.enableSurface = false
Level0World.enableAssets = true
Level0World.enableClutter = false
Level0World.enableNodes = true
Level0World.enableCreations = true
Level0World.enableHarvestables = true
Level0World.enableKinematics = true
Level0World.renderMode = "warehouse"
Level0World.isIndoor = true
Level0World.worldBorder = false

function Level0World.server_onCreate( self )
	BaseWorld.server_onCreate( self )
	dofile("$CONTENT_DATA/Scripts/terrain/blueprints_level0.lua")
end

function Level0World.client_onCreate( self )
	BaseWorld.client_onCreate( self )

	self.ambienceEffect = sm.effect.createEffect( "WarehouseAmbiance" )
	self.ambienceEffect:start()
end

function Level0World.sv_e_onChatCommand( self, params )
	BaseWorld.sv_e_onChatCommand( self, params )
end

function Level0World.client_onUpdate( self, deltaTime )
	BaseWorld.client_onUpdate( self, deltaTime )
end

function Level0World.server_onCellCreated( self, x, y )
	BaseWorld.server_onCellCreated( self, x, y )
end

function Level0World.server_onCellLoaded( self, x, y )
	BaseWorld.server_onCellLoaded( self, x, y )
end

function Level0World.server_onProjectile( self, hitPos, hitTime, hitVelocity, _, attacker, damage, userData, hitNormal, target, projectileUuid )
	BaseWorld.server_onProjectile( self, hitPos, hitTime, hitVelocity, _, attacker, damage, userData, hitNormal, target, projectileUuid )
end

function Level0World.server_onMelee( self, hitPos, attacker, target, damage, power, hitDirection, hitNormal )
	BaseWorld.server_onMelee( self, hitPos, attacker, target, damage, power, hitDirection, hitNormal )
end

function Level0World.server_updateRestrictions( self, restrictions )
    --lol empty func idk
end
