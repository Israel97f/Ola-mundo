--[[
    Modifique o	código do exercício	anterior para
que ele use a sintaxe ["key"]=value apenas quando
necessário (isto é, quando a chave for uma cadeia
, mas não um identificador válido).
--]]

function eNomeValido (k)
    return string.match(k, "^[a-zA-Z_][a-zA-Z0-9_]*$") ~= nil and
        not ePalavraReservada(k)
end

function ePalavraReservada (k)
    local palavrasChaves = {
        ["and"] = true, ["break"] = true,
        ["do"]= true, ["else"] = true,
        ["elseif"] = true, ["end"] = true,
        ["false"] = true, ["for"] = true,
        ["function"] = true, ["goto"] = true,
        ["if"] = true, ["in"] = true,
        ["local"] = true, ["nil"] = true,
        ["not"] = true, ["or"] = true, 
        ["repeat"] = true, ["return"] = true,
        ["then"] = true, ["true"] = true, 
        ["until"] = true, ["while"] = true
    }
    
    return palavrasChaves[k]
end

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
                if not eNomeValido(k) then
                    io.write(
                        string.format('  %s["%s"]%s', iden, k, " = "))
                else
                    io.write(
                        string.format('  %s%s%s', iden, k, " = "))
                end
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
local t = {k=1, x=4, z=4, ["1fast"]=5, a, {3, 4},fast=65, ["while"] = 45}
serialize(t)