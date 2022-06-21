local level0_data = {{name = "Kit_Backrooms_0_Corridor_1Way", x = (28/4), y = (28/4), jnt = {"N",  "S" } },
                {name = "Kit_Backrooms_0_Corridor_2Way", x = (28/4), y = (28/4), jnt = { "N", "W" } }, 
		{name = "Kit_Backrooms_0_Corridor_3Way", x = (28/4), y = (28/4), jnt = { "N", "E", "W" } }, 
		{name = "Kit_Backrooms_0_Corridor_4Way", x = (28/4), y = (28/4), jnt = {"N", "E", "W", "S" } },
		{name = "Kit_Backrooms_0_Corridor_NoWalls", x = (28/4), y = (28/4), jnt = {"N", "E", "W", "S" } }
	
}
--ADD YOUR BLUEPRINTS AFTER, DO NOT EDIT ENTRY 4 & 5 (4 WAY CORRIDOR & NO WALL CORRIDOR)
--UPDATE: TO RED GAL: it is now okay to keep rocks behind the walls. still, please remove extra rocks behind the pillar for 1 2 3 4 corridors.
--r4ndytaylor69, 21.06.22
cellData = {}

function spawnTerrain()
print("GENERATING BACKROOM DUNGEON! PLEASE WAIT A DECADE FOR THE MEMORY TO RUN OUT!")
local i, ee, cellPos = 1, 1, {}
local rev = 1
while i <= 80 do cellData[i] = {}

i = i + 1 
end
cellData[50][50] = level0_data[4]
--GENERATE DUNGEON: 6 ITERATIONS
while rev < 7 do
print("GENERATING DUNGEON: ", rev, "ITERATIONS")
for a, b in pairs(cellData) do 

	for c, d in pairs(b) do 
	if a < 78 and a > 3 and c < 78 and c > 3 then 
	for k, v in pairs(d.jnt) do
		local newCell = level0_data[math.random(1,4)]
		if v == "N" and not cellData[a][c+1] then cellData[a][c+1] = newCell
			elseif v == "E" and not cellData[a-1][c] then cellData[a-1][c] = newCell
			elseif v == "W" and not cellData[a+1][c] then cellData[a+1][c] = newCell
			elseif v == "S" and not cellData[a][c-1] then cellData[a][c-1] = newCell
		end
		
			
 		
	end
end
end end
rev = rev + 1
end
rev = 1
local function checkInTable(tbl, val)
  for i,v in ipairs(tbl) do
    if v == val then
      return true
    end
  end
end 
--VERIFY DUNGEON (TEMPORARY CODE, PENDING REWRITE)
while rev < 93 do
print("VERIFYING DUNGEON: ", rev, "ITERATIONS")

for aa, bb in pairs(cellData) do 

	for cc, dd in pairs(bb) do 
	if aa < 78 and aa > 3 and cc < 78 and cc > 3 then 
--	dd.violations = dd.jnt
	--GET DUNGEON VIOLATIONS
	for k, v in pairs(dd.jnt) do
		local newCell = level0_data[math.random(1,4)]
		local status = {}
		local Q, W, E, R = cellData[aa][cc+1], cellData[aa-1][cc], cellData[aa+1][cc], cellData[aa][cc-1]
		if (Q) and (W) and (E) and (R) then if (Q.jnt) and (W.jnt) and (E.jnt) and (R.jnt) then
			if v == "N" then 
				status[1] = "S"
				status[2] = cellData[aa][cc+1]
			elseif v == "E" and W.jnt.W == nil then 
				status[1] = "W"
				status[2] = cellData[aa-1][cc]
			elseif v == "W" and E.jnt.E == nil then 
				status[1] = "E"
				status[2] = cellData[aa+1][cc]
			elseif v == "S" and R.jnt.N == nil then 
				status[1] = "N"
				status[2] = cellData[aa][cc-1]
			else break 
			end	
			if not checkInTable(status[2], status[1]) then 
				while(not checkInTable(newCell.jnt, status[1])) do
					newCell = level0_data[5]
				end
				if(status[1] == "S") then cellData[aa][cc+1] = newCell end
				if(status[1] == "W") then cellData[aa-1][cc] = newCell end
				if(status[1] == "E") then cellData[aa+1][cc] = newCell end
				if(status[1] == "N") then cellData[aa][cc-1] = newCell end
			end
		end end
	end
end
end end
rev = rev + 1
end
print("PATCHING WALLS: ", rev, "ITERATIONS")

print("GENERATING BORDER: ", rev, "ITERATIONS")
local rax, rbx = 1, 1
while rax < 84 do
	if cellData[rax] == nil then
		cellData[rax] = {}
	end
	rbx = 0
	while rbx < 84 do
		
		if cellData[rax][rbx] == nil then
			print(rax, rbx)
			cellData[rax][rbx] = level0_data[4]	
		end
		rbx = rbx + 1
	end
	rax = rax + 1
end

print("SPAWNING DUNGEON")
for q, w in pairs(cellData) do for p, m in pairs(w) do

  if m == nil then m = level0_data[4] end
 sm.creation.importFromFile(sm.world.getCurrentWorld(), "$CONTENT_DATA/Blueprints/"..m.name..".blueprint", sm.vec3.new(-(80*7)+(6*q), -(80*7)+(6*p), 64) )
end end
print("TELEPORTING ALL PLAYERS TO LEVEL 0")
for ext, players in pairs(sm.player.getAllPlayers()) do
players:getCharacter():setWorldPosition(sm.vec3.new(-(80*7)+(6*74),-(80*7)+(6*71),68) )
end
end
--bottom 4, top 16


	

	
