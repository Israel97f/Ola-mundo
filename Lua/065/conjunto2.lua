 -- Altere o programa anterior para que ele aceite apenas números entre 0 e 1000. 

  -- Pega un conjugo de números fornecido pelo usuário
  while true do
    io.write("Quantos elementos deseja inserir no conjunto: ")
    Nel = tonumber(io.read())
    if math.type(Nel) == "integer" then
       break
    end
    print("O elemento digitado não é um inteiro, por favor tente novamente")
end
while true do
    Conjunto = {}
    ValidaConjunto = true
    for i = 1, Nel, 1 do
        io.write("Digite o " .. i .. "° número (0 - 1000): ")
        local N = tonumber(io.read())
        table.insert(Conjunto, N)
        if type(N) ~= "number" or N > 1000 or N < 0 then
            ValidaConjunto = false
        end
    end
    if ValidaConjunto then
        break
    end
    print("Um ou mais elementos do conjunto não eram números ou não estão entre 0 e 1000, tente outra vez")
end

-- calcula a soma dos elementos e verifica maior e o menor elemento do conjunto
for i, j in pairs(Conjunto) do
   if i == 1 then
       Soma = j
       Maior = j
       Menor = j
   else
       Soma = Soma + j
       if Maior < j then
           Maior = j
       end
       if Menor > j then
           Menor = j
       end
   end
end

-- exibe o maior, o menor elementos e a soma dos elementos
print("O maior elemento é " .. Maior .. " o menor é " .. Menor .. " e a soma é " .. Soma)