 --[[
    Faça um programa que peça 10 números inteiros, calcule e mostre a quantidade de números pares 
    e a quantidade de números impares. 
 ]]

 -- pega dez números inteiro
 while true do
    Tabela = {}
    Inteiros = true
    for i = 1, 10 do
        io.write("Digite o " .. i .. "° número: ")
        local n1 = tonumber(io.read())
        table.insert(Tabela, n1)
        if math.type(n1) ~= "integer" then
            Inteiros = false
        end
    end

    if Inteiros then
       break 
    end
    print("um ou mais números digitados não são inteiros, tente novamente")
    Tabela = {}
 end

 -- separa os ímpares dos pares
 NumPares = 0
 for i = 1, #( Tabela )do
    if Tabela[i] % 2 == 0 then
        NumPares = NumPares + 1
    end
 end

 -- exibe o resultado
 print("Dos números digitados " .. NumPares .. " são pares e " .. 10 - NumPares .. " são impares")