--NOTE: We're preparing the void with this script.
--We will be loading LEVEL 0 from the world script when the world is ready.
--thanks for the humourous logs bri'ish guy xD
--r4ndytaylor69 20.06.22

function Init( world, generatorIndex )
    print("frick you lol")
end

function Create( xMin, xMax, yMin, yMax, seed, data )
    print("I'm sitting here doing f*** all lololololol")
end

function Load()
    print("load you bloody dimwit")
    return true
end

function UpgradeCellData( cellData )
    print("#{FUNNY_COMMENT}")
end

function CreateWorldTileStorageKey()
    print("alrighty so basically right yeah so what I'm thinking is you f*** right off")
end

function GetHeightAt( x, y, lod )
	return 0
end

function GetColorAt( x, y, lod )
	return 0, 0, 0
end

function GetMaterialAt( x, y, lod )
	return 0, 0, 0, 0, 0, 0, 0, 0
end

function GetClutterIdxAt( x, y )
	return -1
end

function GetEffectMaterialAt( x, y )
	return "Dirt"
end


blueprintTable = {}

colorTable = {}

local function loadPrefab( prefab, loadFlags, prefabIndex, prefabName )
    print("hahahaha I'm going insane")
end

function PrepareCell( cellX, cellY, loadFlags )
    print("prepare my cells lol")
end

function GetTilePath( uid )
  --  uid = sm.uuid.new("f5aa9696-6a11-4666-bc9c-1dc6efb6c82f")
    --here goes nothing...
    --IT INDEED GOT NOTHING, FUCK TERRAIN TILE GENERATION!
    --r4ndytaylor69, 20.06.22
    
    print("my uuid is 696969-6969-6969-696969 😩😩")
end
