dofile( "$SURVIVAL_DATA/Scripts/game/worlds/BaseWorld.lua")
dofile("$CONTENT_DATA/Scripts/0leveldata.lua")

Level0World = class( BaseWorld )
Level0World.terrainScript = "$GAME_DATA/Scripts/terrain/terrain_flat.lua" -- fix later lol
Level0World.enableSurface = true
Level0World.enableAssets = false
Level0World.enableClutter = false
Level0World.enableNodes = false
Level0World.enableCreations = false
Level0World.enableHarvestables = false
Level0World.enableKinematics = false
Level0World.renderMode = "warehouse"
Level0World.isIndoor = true
Level0World.worldBorder = false
Level0World.terrainGenerated = false
Level0World.cellMinX = -64
Level0World.cellMaxX = 63
Level0World.cellMinY = -48
Level0World.cellMaxY = 47

function Level0World.server_onCreate( self )
	BaseWorld.server_onCreate( self )

end

function Level0World.client_onCreate( self )
	BaseWorld.client_onCreate( self )

	self.ambienceEffect = sm.effect.createEffect( "WarehouseAmbiance" )
	self.ambienceEffect:start()
end

function Level0World.sv_e_onChatCommand( self, params )
	BaseWorld.sv_e_onChatCommand( self, params )
end

function Level0World.server_onFixedUpdate(self,timestep)

end

function Level0World.client_onUpdate( self, deltaTime )
	BaseWorld.client_onUpdate( self, deltaTime )
end

function Level0World.server_onCellCreated( self, x, y )
	BaseWorld.server_onCellCreated( self, x, y )
end

function Level0World.server_onCellLoaded( self, x, y )
	BaseWorld.server_onCellLoaded( self, x, y )
	if(sm.player.getAllPlayers()[1] ~= nil and sm.player.getAllPlayers()[1].character ~= nil) and not self.terrainGenerated then
		self.terrainGenerated = true
		spawnTerrain()	
	end
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
