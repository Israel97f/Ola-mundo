--[[

	Quando aplicamos o programa de frequência de palavras a um texto,
geralmente, as palavras que mais aparecem são as pequenas, sem muito
interesse, como artigos e preposições. Modifique o programa de forma 
que ele ignore as palavras com menos de três letras.

--]]
local file = "texto.txt"


local function allwords ()
	local auxwords = function ()
		for line in io.lines(file) do
			for word in string.gmatch(line, "%w+") do
				-- ignora palavras com menos de 3 letras
				if string.len(word) > 3 then 
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