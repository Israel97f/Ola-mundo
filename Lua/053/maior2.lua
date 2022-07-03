 -- Faça um programa que leia 5 números e informe o maior número. 

 -- pega 5 números e verifica o maior
 Tabela = {0, 0, 0, 0, 0}
 for i = 1, 5, 1 do
    io.write("Digite o " .. i .. "° número: ")
    Tabela[i] = tonumber(io.read())

    if i == 1 then
        Maior = Tabela [1]
    elseif Maior < Tabela[i] then
        Maior = Tabela[i]
    end
 end
 -- exibe o maior
 print("O maior número é " .. Maior)
