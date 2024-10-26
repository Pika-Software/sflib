local function gitHubLink( gitRep, fileName )
    if gitRep:sub(1, 8) ~= "https://" then return "Invalid link!" end
    
    local modifiedLink = string.gsub( gitRep, "github.com", "raw.githubusercontent.com" )
    modifiedLink = modifiedLink .. "main/"
    print( modifiedLink .. fileName )
    --return modifiedLink .. fileName
end

local sounds = {}
function bassUrlPlay( url, entity )
    local sound = sounds[url]        
    if sound and sound:isValid() then            
        sound:stop()
    end
    bass.loadURL(url, "3d noplay noblock", function(new, _, errtxt)            
        if not (new and new:isValid()) then
            print(err)                
            return
        end
        sound = new            
        new:setFade(20, 400)
        new:setVolume(2)            
        new:play()
        sounds[url] = sound
        hook.add("think", "snd", function()                
            if new:isValid() and entity:isValid() then
                new:setPos(entity:localToWorld(entity:obbCenter()))                
            end
        end)        
    end)
end
