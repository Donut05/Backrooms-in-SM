local level0_data = {{name = "lv0corridor1", x = (28/4), y = (28/4), jnt = {"N", "S" } },
                {name = "lv0corridor2", x = (28/4), y = (28/4), jnt = {"N", "W" } }, 
		{name = "lv0corridor3", x = (28/4), y = (28/4), jnt = {"N", "E", "W" } }, 
		{name = "lv0corridor4", x = (28/4), y = (28/4), jnt = {"N", "E", "W", "S" } }
	
}

pendingGeneration = {}
Generation = {}
hash = {}
cellData = {}



function initialiseData(rand, vec3, cellpos)
	--empty func again????
end

function initialiseData(rand, vec3, cellpos) end

function spawnTerrain()
	local i, ee, cellPos = 1, 1, {}
	local rev = 1
	while i <= 80 do
		cellData[i] = {}
		local i, ee, cellPos = 1, 1, {}
		local rev = 1
		while i <= 80 do
			cellData[i] = {}
			i = i + 1 
		end
	end
	cellData[50][50] = level0_data[4]
	i = i + 1 
	cellData[50][50] = level0_data[4]

	while rev < 11 do
		for a, b in pairs(cellData) do 
			if a > 79 or a < 1 then break end
			for c, d in pairs(b) do 
				if c > 79 or c < 1 then break end
				if d == nil then d = level0_data[math.random(1,4)] end
				for k, v in pairs(d.jnt) do
					local newCell = level0_data[math.random(1,4)]
					if v == "N" then cellData[a][c+1] = newCell
					elseif v == "E" then cellData[a-1][c] = newCell
					elseif v == "W" then cellData[a+1][c] = newCell
					elseif v == "S" then cellData[a][c-1] = newCell end
				end
			end
		end
		rev = rev + 1
	end
	for c, d in pairs(b) do 
		if c > 79 or c < 1 then break end
		if d == nil then d = level0_data[math.random(1,4)] end
		for k, v in pairs(d.jnt) do
			for q, w in pairs(cellData) do
				for p, m in pairs(w) do
					print(q, p, m.name)
					if m == nil then m = level0_data[4] end
					sm.creation.importFromFile(sm.player.getAllPlayers()[1].character:getWorld(), "$CONTENT_DATA/Blueprints/"..m.name..".blueprint", sm.vec3.new(-(80*7)+(6*q), -(80*7)+(6*p), 64) )
				end
			end
		end
		for ext, players in pairs(sm.player.getAllPlayers()) do
			players:getCharacter():setWorldPosition(sm.vec3.new(-524,-524,68))
		end
		--bottom 4, top 16
		local newCell = level0_data[math.random(1,4)]
		if v == "N" then cellData[a][c+1] = newCell
		elseif v == "E" then cellData[a-1][c] = newCell
		elseif v == "W" then cellData[a+1][c] = newCell
		elseif v == "S" then cellData[a][c-1] = newCell end
		rev = rev + 1
	end
	for q, w in pairs(cellData) do for p, m in pairs(w) do
		print(q, p, m.name)
		if m == nil then m = level0_data[4] end
		local creation = sm.creation.importFromFile(sm.world.getCurrentWorld(), "$CONTENT_DATA/Blueprints/"..m.name..".blueprint", sm.vec3.new(-(80*7)+(6*q), -(80*7)+(6*p), 64) )
		for _,body in pairs(creation) do
			body:setErasable(false)
			body:setDestructable(false)
		end
	end
	for ext, players in pairs(sm.player.getAllPlayers()) do
		players:getCharacter():setWorldPosition(sm.vec3.new(-524,-524,68))
	end
end end