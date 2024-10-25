local function gitHubLink( gitRep, fileName )
    if gitRep:sub(1, 8) ~= "https://" then return "Invalid link!" end
    
    local modifiedLink = string.gsub( gitRep, "github.com", "raw.githubusercontent.com" )
    modifiedLink = modifiedLink .. "main/"
    print( modifiedLink .. fileName )
    --return modifiedLink .. fileName
end