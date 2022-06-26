 --[[
    Faça um Programa que peça um número e informe se o número é inteiro ou decimal. Dica: utilize uma
    função de arredondamento.
 ]]

 -- Pega um número
 io.write("Digite um número: ")
 Num = tonumber(io.read())

 -- verifica se o número é inteiro ou decimal
 if Num % 1 == 0 then
    Mensagem = Num .. " é inteiro"
 else
    Mensagem = Num .. " é decimal"
 end

 -- exibe a mensagem
 print(Mensagem)