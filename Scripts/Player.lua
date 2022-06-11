dofile "$GAME_DATA/Scripts/game/CreativePlayer.lua"

Player = class( CreativePlayer )

function Player.server_onCreate( self )
    SurvivalPlayer.server_onCreate( self )
	print("Player.server_onCreate")
end
