--[[
 A abordagem de evitar construtores ao salvar tabelas com ciclos é muito radical. É possível salvar a tabela em um formato mais agradável usando construtores para o caso	geral e, depois, atribuições, apenas para	corrigir compartilhamentos e laços.
Reimplemente a função save usando essa	estratégia.	Adicione todas as comodidades	que você implementou nos exercícios anteriores (indentação,	sintaxe	de	 registros e	sintaxe	de listas).
]]

function validVarNome (nome)
    return string.match(nome ,"^[a-zA-Z_][a-zA-Z0-9_]*$") 
end

function realizaAtribuicoes (tab)
    print("____")
    local chaves = {}
    for k, _ in pairs(tab) do table.insert(chaves, k) end
    for _, v in ipairs(chaves) do
        io.write(string.format('%s = %s\n', v, tab[v]))
    end
end

function serialize (valor, tabelaNome, ident, tabelasRegistradas, k, listaAtribui)
    ident = ident or ""
    local proxIdent = ident ..' '
    local listaAtribui = listaAtribui or {} 
    tabelasRegistradas = tabelasRegistradas or {}
    if type(valor) == "number" then
        io.write( valor, ",\n")
    elseif type(valor) == "string" then
        io.write(string.format("%q,\n", valor))
    elseif type(valor) == "table" then
        if not tabelasRegistradas[valor] then
            tabelasRegistradas[valor] = tabelaNome
            if ident == "" then
                io.write(tabelaNome .. " = ")
            end
                
            io.write("{\n")
            for k, v in pairs(valor) do
                local tabNome = string.format('%s[%s]', tabelaNome, k)
                io.write(proxIdent)
                
                if type(k) == "string" then
                    if validVarNome(k) then
                        io.write(string.format("%s%s", k , " = "))
                
                    else
                        io.write(string.format('["%s"]%s', k , " = "))
                        
                    end
                    tabNome = string.format('%s["%s"]', tabelaNome, k)
                end
                
                serialize(v, tabNome, proxIdent, tabelasRegistradas, k, listaAtribui)
            end
            -- necessario para tira a virgula do fecha chave da tabela pricipal
            if ident ~= "" then
                io.write(ident .. '},\n')
            else
                io.write('}\n')
                realizaAtribuicoes(listaAtribui)
            end
        else
            io.write('nil' .. ',\n')
            listaAtribui[string.format('%s', tabelaNome)] = tabelasRegistradas[valor]
        end
        
    end
end

local d = {45, 56, 67}
--local a = {1, 2, x=4, {6,10, b=67, "mell ", {9,8,7}}, ["97gama"] = 65, d}
local b = {1, 2, {1,2,{1, 2, {1,2,{0,0},{6,6}, {5,5}}}}}

a = {x=1, y=2; {3,4,5},j = {3, 5}}
a[2] = a				--	ciclo
a.z	= a[1] --	subtabela	compartilhada
a.w = {}
a.w.f = a[2]
a["67gup"] = a.j
serialize(a, "g")
--serialize(b)
