local level0_data = { {name = "lv0corridor1", x = (28/4), y = (28/4), jnt = {"N", "S" } },
                {name = "lv0corridor2", x = (28/4), y = (28/4), jnt = {"N", "W" } }, 
		{name = "lv0corridor3", x = (28/4), y = (28/4), jnt = {"N", "E", "W" } }, 
		{name = "lv0corridor4", x = (28/4), y = (28/4), jnt = {"N", "E", "W", "S" } }
}

pendingGeneration = {}
Generation = {}
hash = {}
cellData = {}



function initialiseData(rand, vec3, cellpos)
	

end

function spawnTerrain()
local i, cellPos = 1, {}
local rev = 1
while i <= 80 do cellData[i] = {} i = i + 1 end
cellData[50][50] = level0_data[4]

while rev < 6 do
for a, b in pairs(cellData) do 
if a > 79 or a < 1 then break end 
	for c, d in pairs(b) do 
	if c > 79 or c < 1 then break end
	if d == nil then d = {} end
	for k, v in pairs(d.jnt) do
		if rev <= 5 then
			local newCell = level0_data[math.random(1,4)]
			if v == "N" then cellData[a][c+1] = newCell
			elseif v == "E" then cellData[a-1][c] = newCell
			elseif v == "W" then cellData[a+1][c] = newCell
			elseif v == "S" then cellData[a][c-1] = newCell
			end
		else 
			local newCell = level0_data[4]
			if v == "N" and not cellData[a][c+1].jnt["S"] then  
			elseif v == "E" and not cellData[a-1][c].jnt["W"] then 
			elseif v == "W" and not cellData[a+1][c].jnt["E"] then 
			elseif v == "S" and not cellData[a][c-1].jnt["N"] then 
			else break
			end
			cellData[a][c] = newCell
 		end
	end
end end
rev = rev + 1
end

for q, w in pairs(cellData) do for p, m in pairs(w) do
  if m == nil then m = level0_data[4] end
 sm.creation.importFromFile( sm.player.getAllPlayers()[1].character:getWorld(), "$CONTENT_DATA/Blueprints/"..m.name..".blueprint", sm.vec3.new(-(80*7)+(6*q), -(80*7)+(6*p), -1) )
end end
end
--bottom 4, top 16

function generateLv0(step)
	
	sm.player.getAllPlayers()[1].character:setWorldPosition(sm.vec3.new(0,0,69))
	spawnInit(1, { 0, 0 },  "N" )
	spawnInit(1, { 0, 0 },  "N" )
	pendingGeneration[1].posy = 0
	pendingGeneration[2].posy = 0
	--generateBorder()
	spawnTerrain()

end


function xor (a,b)
if a ~= b then return true else return false end
end

function spawnInit(rand, vec3,  gg)

	print("VECTOR3:", vec3[1], vec3[2])
	local lvlData = {}
	lvlData = level0_data[rand]

	for k, v in pairs(lvlData.jnt) do 
		if gg == "N" and v == "S" then lvlData.posx = vec3[1] - (28/4) break
		elseif gg == "E" and v == "W" then lvlData.posx = vec3[1] + (28/4) break
		elseif gg == "W" and v == "E" then lvlData.posy = vec3[2] - (28/4) break
		elseif gg == "S" and v == "N" then lvlData.posy = vec3[2] + (28/4) break
		else 
			lvlData = level0_data[4] 
		if gg == "N" and v == "S" then lvlData.posx = vec3[1] - (28/4) break
		elseif gg == "E" and v == "W" then lvlData.posx = vec3[1] + (28/4) break
		elseif gg == "W" and v == "E" then lvlData.posy = vec3[2] - (28/4) break
		elseif gg == "S" and v == "N" then lvlData.posy = vec3[2] + (28/4) break
			end
	
		end
	end
	if lvlData.posx == nil then lvlData.posx = vec3[1] end
	if lvlData.posy == nil then lvlData.posy = vec3[2] end

	 sm.creation.importFromFile( sm.player.getAllPlayers()[1].character:getWorld(), "$CONTENT_DATA/Blueprints/"..lvlData.name..".blueprint", sm.vec3.new(lvlData.posx, lvlData.posy, 64) )

	if table.maxn(pendingGeneration) <= 600 then
		table.insert(pendingGeneration, lvlData)
		
	end	
end
function generateBorder() 
local a, b = 0, 0
while a < 40 do while b < 40 do
 sm.creation.importFromFile( sm.player.getAllPlayers()[1].character:getWorld(), "$CONTENT_DATA/Blueprints/lv0corridor4.blueprint", sm.vec3.new(0+(b), 0+(a), 64) )
b = b + 1
end
b = 0 
a = a + 1
end
end
function generateTerrain(step) 
	local ij = 1
	for k, v in pairs(pendingGeneration) do 
		if k > 600 then break end
			print("ALERT:", k, v.posx, v.posy)
			for i, s in ipairs(v.jnt) do
				spawnInit( math.random(1,4), {v.posx,v.posy}, s)
			end
			ij = ij + 1
			print("REVISION:", ij)
			
		
	end
		spawnTerrain()
	--[[for _,body in pairs(sm.body.getAllBodies()) do
 	   body:setDestructable(false)
 	   body:setErasable(false)
	   body:setBuildable(false)
	   body:setPaintable(false)
	end]]
end