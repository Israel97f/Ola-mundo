function nextValor ()
    local itera = 10
    return function ()
            itera = itera + 1
            return itera < 21 and itera 
        end
end


local next = nextValor()

while true do
    local a = next()
    if not a then break end
    
    print(a)
end

print("")
local next2 = nextValor()
while next2() do
    print(a)
end