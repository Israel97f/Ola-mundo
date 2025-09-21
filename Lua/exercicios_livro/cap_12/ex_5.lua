--[[
 A abordagem de evitar construtores ao salvar tabelas com ciclos é muito radical. É possível salvar a tabela em um formato mais agradável usando construtores para o caso	geral e, depois, atribuições, apenas para	corrigir compartilhamentos e laços.
Reimplemente a função save usando essa	estratégia.	Adicione todas as comodidades	que você implementou nos exercícios anteriores (indentação,	sintaxe	de	 registros e	sintaxe	de listas).
]]

function validVarNome (nome)
    return string.match(nome ,"^[a-zA-Z_][a-zA-Z0-9_]*$") 
end

function serialize (valor, ident)
    ident = ident or ""
    if type(valor) == "number" then
        io.write( valor, ",\n")
    elseif type(valor) == "string" then
        io.write(string.format("%q,\n", valor))
    elseif type(valor) == "table" then
        ident = ident .. ident
        io.write(string.format("%s{\n", string.sub(ident, 3)))
        for k, v in pairs(valor) do
            if type(k) == "string" then
                if validVarNome(k) then
                    io.write(string.format("%s%s%s%s", ident, "  ", k , " = "))
                else
                    io.write(string.format('%s%s["%s"]%s', ident, "  ", k , " = "))
                end
            elseif type(k) == "number" then
                io.write("  " .. ident)
            end
            serialize(v, "  ")
        end
        local vir = ""
        if string.len(ident) > 0 then vir = "," end
        io.write(string.format("%s}%s\n", string.sub(ident, 1), vir))
        
    end
end




local a = {1, 2, x=4, {6,10, b=67, "mell ", {9,8,7}}, ["97gama"] = 65}
local b = {1, 2, {1,2,{1, 2, {1,2,{0,0}}}}}
serialize(a)
serialize(b)
