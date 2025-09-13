--[[
Repita o Exercício 10.3, mas, em vez de usar o tamanho como critério para
ignorar uma palavra, o programa deverá ler de um arquivo de texto uma lis-
ta de palavras a serem ignoradas.
--]]

local file = "texto.txt"
local file2 = "ignore.txt"

local listaIgnora = {}
for w in io.lines(file2) do
	listaIgnora[w] = true
end


local function allwords ()
	local auxwords = function ()
		for line in io.lines(file) do
			for word in string.gmatch(line, "[%wçÇáéíóúãõâêîôûÀ-ÿ]+") do
				-- ignora palavras com menos de 3 letras
				if not listaIgnora[word] then 
					coroutine.yield(word)
				end
			end
		end
	end
	return coroutine.wrap(auxwords)
end


local counter = {}
for w in allwords() do
	counter[w] = (counter[w] or 0) + 1
end


local words = {}
for w in pairs(counter) do
	words[#words + 1] = w
end


table.sort(
	words, 
	function (w1, w2)
		return counter[w1] > counter[w2] or
		counter[w1] == counter[w2] and w1 < w2
	end
)


for i = 1, (tonumber(arg[1]) or 10) do
	print(words[i], counter[words[i]])
end


function prefix (w1, w2)
	return w1 .. " " .. w2
end