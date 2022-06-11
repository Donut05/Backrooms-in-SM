dofile "$GAME_DATA/Scripts/game/CreativeGame.lua"

Game = class( CreativeGame )

function Game.server_onCreate( self )
    SurvivalGame.server_onCreate( self )
	print("Game.server_onCreate")
end
