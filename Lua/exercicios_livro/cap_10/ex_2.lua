-- checa se é solução ou não
local function checa_solucao(a)
	for i = 1, #a do
		for j = i + 1, #a do
			if a[i] == a[j] or
			   i - a[i] == j - a[j] or
			   i + a[i] == j + a[j] 
			then
				return false

			end
		end
	end
	return true
end

-- cria uma copia da tabela
local function copia_tabela(t)
	local copia = {}
	for i = 1, #t do
		copia[i] = t[i]
	end 
	return copia
end

-- cria uma lista de permutações de 8 elementos de 1 a 8
T = {}
local permt = {}
local function permutacao(a, n)
	if n <= 0 then
		table.insert(T, copia_tabela(permt))
		--print(table.unpack(permt))

	end


	for i = 1, n do
		table.insert(permt, a[i])

		local copia = copia_tabela(a)

		table.remove(copia, i)
		permutacao(copia, n - 1)
	end

	table.remove(permt, #permt)
end



local ta = {1, 2, 3, 4, 5, 6, 7, 8}
permutacao(ta, 8)

local cont = 0
for i=1, #T do
	if checa_solucao(T[i]) then
		for j=1, #T[i] do
			io.write(string.format(" %d ", T[i][j]))
		end
		io.write("\n")
		cont = cont + 1
	end
end

print("existe um total de soluções:", cont)
print("existe um total de permutações:", #T)

-- o metodo original do ex_1 chama isplaceok 15720 vezes enquanto o número
-- de permutações foi 40320.
