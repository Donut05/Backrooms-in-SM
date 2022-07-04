local level0_data = {
		{name = "Kit_Backrooms_0_Corridor_1Way", x = (28/4), y = (28/4), jnt = {"N",  "S" }, rotationindex = {0,0,0}},
        {name = "Kit_Backrooms_0_Corridor_2Way", x = (28/4), y = (28/4), jnt = { "N", "W" }, rotationindex = {0,0,0} }, 
		{name = "Kit_Backrooms_0_Corridor_3Way", x = (28/4), y = (28/4), jnt = { "N", "E", "W" }, rotationindex = {0,0,0} }, 
		{name = "Kit_Backrooms_0_Corridor_4Way", x = (28/4), y = (28/4), jnt = {"N", "E", "W", "S" }, rotationindex = {0,0,0} },
		{name = "Kit_Backrooms_0_Corridor_NoWalls", x = (28/4), y = (28/4), jnt = {"N", "E", "W", "S" }, rotationindex = {0,0,0} },
		{name = "Kit_Backrooms_0_Corridor_1Wall", x = (28/4), y = (28/4), jnt = {"N" }, rotationindex = {0,0,0}},
}

--ADD YOUR BLUEPRINTS AFTER, DO NOT EDIT ENTRY 4 & 5 (4 WAY CORRIDOR & NO WALL CORRIDOR)
--UPDATE: TO ILLUMINA: it is now okay to keep rocks behind the walls. but still, please remove extra rocks behind the pillars for 1 2 3 4 corridors.
--r4ndytaylor69, 21.06.22
--Ok lmao |Illumina, 21.06.22
--You did not remove the extra rocks. it is still Z-fighting.
--r4ndytaylor69, 22.06.22
local rotation_data = {
	{{0,90,0}, {"N"}, {"E"} },
	{{0,0,0}, {"N"}, {"N"} },
	{{0,180,0}, {"N"}, {"W"} },
	{{0,270,0}, {"N"}, {"S"} },
	{ {0,90,0}, {"N", "S"}, {"E", "W"} },
	{ {0,0,0}, {"N", "S"}, {"N", "S"} },
	{{0,90,0}, {"N", "W"}, {"N", "E"} },
	{{0,0,0}, {"N", "W"}, {"N", "Q"} },
	{{0,180,0}, {"N", "W"}, {"E", "S"} },
	{{0,270,0}, {"N", "W"}, {"W", "S"} },
	{{0,0, 0}, {"N", "E", "W"}, {"N","E","W"} },
	{{0,90, 0}, {"N", "E", "W"}, {"N","W","S"} },
	{{0,180,0}, {"N", "E", "W"},{"E","W","S"}  },
	{{0,270,0}, {"N", "E", "W"}, {"N","E","S"} },
	{{0,0,0}, {"N","E","W","S"}, {"N","E","W","S"} }
}
--[[
	ROTATION INDEX:
	1 WAY: E, W = ROTATION 90 DEGREES - |
	2 WAY: N, E = ROTATION 90 DEGREES, E, S = ROTATION 180 DEGREES, W, S = ROTATION 270 DEGREES
	3 WAY: N, W, S = ROTATION 90 DEGREES, E, W, S = ROTATION 180 DEGREES, N, E, S = ROTATION 270 DEGREES
	4 WAY: ANY
]]

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
local function compareTables(t1, t2)
if #t1 ~= #t2 then return false end
	for i=1,#t1 do
	  if t1[i] ~= t2[i] then return false end
	end
	return true
end

local function removeTableKey(tbl, val)
	for i,v in ipairs(tbl) do
	  if v == val then
		table.remove(tbl, i)
		return tbl
	  end
	end
  end 

local function checkInTable(tbl, val)
  for i,v in ipairs(tbl) do
    if v == val then
      return true
    end
  end
end 
--VERIFY DUNGEON (TEMPORARY CODE, PENDING REWRITE)
while rev < 2 do
print("VERIFYING DUNGEON: ", rev, "ITERATIONS")

for aa, bb in pairs(cellData) do 

	for cc, dd in pairs(bb) do 
		if aa < 78 and aa > 3 and cc < 78 and cc > 3 then 
			local violations = dd.jnt
			for k, v in pairs(dd.jnt) do
				local newCell = level0_data[math.random(1,4)]
				local status = {}
				local Q, W, E, R = cellData[aa][cc+1], cellData[aa-1][cc], cellData[aa+1][cc], cellData[aa][cc-1]
				if (Q) and (W) and (E) and (R) then if (Q.jnt) and (W.jnt) and (E.jnt) and (R.jnt) then
					if v == "N" and not checkInTable(Q.jnt, "S") then
						violations = removeTableKey(violations, v)
					elseif v == "S" and not checkInTable(R.jnt, "N") then
						violations = removeTableKey(violations, v)
					elseif v == "E" and not checkInTable(W.jnt, "W") then
						violations = removeTableKey(violations, v)
					elseif v == "W" and not checkInTable(E.jnt, "E") then
						violations = removeTableKey(violations, v)
					end

				end end
			
			end
			for rotation, data in pairs(rotation_data) do
			
				if (compareTables(violations, data[3])) then
					for newtile, finder in pairs(level0_data) do
						if (compareTables(data[2], finder.jnt)) then
							dd = finder
							dd.jnt = data[2]
							dd.rotationindex = data[1]
							break
						end
					end
				end
			end

		end
	end 
end
rev = rev + 1
end
print("PATCHING WALLS: ", rev, "ITERATIONS")

print("GENERATING BORDER: ", rev, "ITERATIONS")
-- local rax, rbx = 1, 1
-- while rax < 84 do
-- 	if cellData[rax] == nil then
-- 		cellData[rax] = {}
-- 	end
-- 	rbx = 0
-- 	while rbx < 84 do
		
-- 		if cellData[rax][rbx] == nil then
-- 			cellData[rax][rbx] = level0_data[4]	
-- 		end
-- 		rbx = rbx + 1
-- 	end
-- 	rax = rax + 1
-- end

print("SPAWNING DUNGEON")
for q, w in pairs(cellData) do for p, m in pairs(w) do

  if m == nil then m = level0_data[4] end
  --FUCK YOU Z-UP YOU BLOODY POOPER PISS OFF
  local creation = sm.creation.importFromFile(sm.world.getCurrentWorld(), "$CONTENT_DATA/Blueprints/"..m.name..".blueprint", sm.vec3.new(-(80*7)+(6*q), -(80*7)+(6*p), 64), sm.quat.fromEuler(sm.vec3.new(m.rotationindex[1], m.rotationindex[3], m.rotationindex[2])) )
  for _,body in pairs(creation) do
	  body:setErasable(false)
	  body:setDestructable(false)
	  body:setConvertibleToDynamic(false)
	  body:setBuildable(false)
  end
end end
print("TELEPORTING ALL PLAYERS TO LEVEL 0")
for ext, players in pairs(sm.player.getAllPlayers()) do
players:getCharacter():setWorldPosition(sm.vec3.new(-(80*7)+(6*50),-(80*7)+(6*51),68) )
end
end
--bottom 4, top 16


	

	
