dofile "$CONTENT_DATA/Scripts/SurvivalPlayer.lua"

Player = class( SurvivalPlayer )

function Player.server_onCreate( self )
    SurvivalPlayer.server_onCreate( self )
	print("Player.server_onCreate")
end
