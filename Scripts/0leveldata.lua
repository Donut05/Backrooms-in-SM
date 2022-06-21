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
<<<<<<< HEAD
	--empty func again????
=======
	

>>>>>>> parent of 0e29494 (andrew this took like an hour wtf)
end

function spawnTerrain()
local i, ee, cellPos = 1, 1, {}
local rev = 1
while i <= 80 do cellData[i] = {}

i = i + 1 
end
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
			elseif v == "S" then cellData[a][c-1] = newCell
			end
		
			
 		
	end
end end
rev = rev + 1
end

for q, w in pairs(cellData) do for p, m in pairs(w) do
print(q, p, m.name)
  if m == nil then m = level0_data[4] end
 local creation = sm.creation.importFromFile(sm.player.getAllPlayers()[1].character:getWorld(), "$CONTENT_DATA/Blueprints/"..m.name..".blueprint", sm.vec3.new(-(80*7)+(6*q), -(80*7)+(6*p), 64) )
 for _,body in pairs(creation) do
	body:setErasable(false)
	body:setDestructable(false)
end
end end

for ext, players in pairs(sm.player.getAllPlayers()) do
players:getCharacter():setWorldPosition(sm.vec3.new(-524,-524,68)
end
end
--bottom 4, top 16


	

	

