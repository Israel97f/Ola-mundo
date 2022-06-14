--[[
    João Papo-de-Pescador, homem de bem, comprou um microcomputador para controlar o rendimento diário
    de seu trabalho. Toda vez que ele traz um peso de peixes maior que o estabelecido pelo regulamento
    de pesca do estado de São Paulo (50 quilos) deve pagar uma multa de R$ 4,00 por quilo excedente.
    João precisa que você faça um programa que leia a variável peso (peso de peixes) e calcule o excesso.
    Gravar na variável excesso a quantidade de quilos além do limite e na variável multa o valor 
    da multa que João deverá pagar. Imprima os dados do programa com as mensagens adequadas. 
]]

 -- pega o peso dos peixes pescados
 io.write("Digite o peso dos peixes pescados em kg: ")
 Peso = tonumber(io.read())

 -- calcula a multa relativa ao peso excedido
 Excesso = Peso - 50
 if Peso < 50 then Excesso = 0 end

 Multa = Excesso * 4

 -- Mostra os valores calculados
 print("O valor excedido foi: ".. tostring(Excesso) .." kg")
 print("A multa gerada pelo excesso é: " .. tostring(Multa) .. " R$")
