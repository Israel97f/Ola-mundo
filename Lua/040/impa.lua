 --[[
    Faça um Programa que peça um número inteiro e determine se ele é par ou impar. Dica: utilize o
    operador módulo (resto da divisão).
]]

 -- pega um número
 io.write("Digite um número: ")
 Num = tonumber(io.read())

 -- determina se o número é ímpar ou par
 if Num % 1 == 0 then
    if Num % 2 == 0 then
        Mensagem = Num .. " é par"
    else
        Mensagem = Num .. " é ímpar"
    end
 else
    Mensagem = Num .. " não é um numero inteiro"
 end

 -- exibe a mensagem
 print(Mensagem)
