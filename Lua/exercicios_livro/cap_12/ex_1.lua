--[[
    Modifique o	código da Listagem 12.2 para que
ele indente tabelas aninhadas (dica: adicione um
parâmetro extra	a serialize	com	a cadeia de	inden-
tação).
--]]


function serialize (o, iden)
    iden = iden or ""
    if	type(o)	==	"number"	then
        io.write(o)
    elseif	type(o)	==	"string" then 
        io.write(string.format("%q", o))
    elseif	type(o)	==	"table"	then
        io.write(string.format("%s{\n", 
            string.sub(iden, 2)))
        for	k,v	in	pairs(o) do
            if type(k) ~= "number" then
                io.write(
                    string.format("  %s%s%s", iden, k, " = "))
            else
                io.write(" ", iden)
            end
            serialize(v, "  ")
            io.write(",\n")
        end
        io.write(string.format("%s}\n", iden))
    else
        error("cannot serialize	a " .. type(o)) 
    end
end


local a = {4, 5, 8, 1}
local t = {k=1, x=4, z=4, ["fast"]=5, a, {3, 4}}
serialize(t)