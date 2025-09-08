--[[
	Generalize o algoritmo de cadeias de Markov para que ele use qualquer
tamanho para a sequência de palavras anteriores usada na escolha da próxi-
ma palavra.
--]]


function allwords ()
	local fille = io.open("texto.txt")
	local line = fille:read()
	-- linha corrente
	local pos = 1
	-- posição corrente na linha
	return function ()
		-- função iteradora
		while line and (line ~= "Paro!!") do
			--print(line)
			-- repete enquanto há linhas
			local s, e = string.find(line, "[%wçÇáéíóúãõâêîôûÀ-ÿ]+", pos)
			if s then
				-- encontrou uma palavra?
				pos = e + 1
				-- atualiza a próxima posição
				return string.sub(line, s, e)
				-- retorna a palavra
			else
				line = fille:read()
				-- não encontrou a palavra;
				-- tenta a próxima linha
				pos = 1
				-- reinicia na primeira posição
			end
		end
		fille:close()
		return nil
		-- não há mais linhas: fim do percurso
	end
end


function prefix (tab)
	local str = ""
	for w in ipairs(tab) do
		if str == "" then
			str = w
		else
			tr = str .. " " .. w
		end
	end
	return str
end


local statetab = {}
function insert (index, value)
	local list = statetab[index]
	if list == nil then
		statetab[index] = {value} 
	else
		list[#list + 1] = value
	end
end

print(string.rep("+++", 40))
local N = 2
local MAXGEN = 100
local NOWORD = "\n"
-- inicializa uma tabela
local ws = {}
for i= 1, N do
	ws[i] = "\n"
end
-- constrói a tabela
--local w1, w2 = NOWORD, NOWORD
for w in allwords() do
	insert(prefix(ws), w)
	table.insert(ws, w)
	if #ws == N + 1 then
		table.remove(ws, 1)
	end
end
insert(prefix(ws), NOWORD)
-- gera o texto
local ws2 = {}
for i= 1, N do
	ws2[i] = "\n"
end
-- reinicializa
for i = 1, MAXGEN do
	local list = statetab[prefix(ws2)]
	-- escolhe um item randômico na lista
	local r = math.random(#list)
	local nextword = list[r]
	--if nextword == NOWORD then return end
	io.write(nextword, " ")
	table.insert(ws2, nextword)
	if #ws2 == N + 1 then table.remove(ws2, 1) end
end
print()
print(string.rep("+++", 40))