 -- Faça um programa que pergunte o preço de três produtos e informe qual produto você deve comprar,
 -- sabendo que a decisão é sempre pelo mais barato. 

 -- pede o preço de três produtos
 io.write("Digite um preço: ")
 P1 = tonumber(io.read())
 io.write("Digite outro preço: ")
 P2 = tonumber(io.read())
 io.write("Digite mais um preço: ")
 P3 = tonumber(io.read())

 -- checa qual o menor preço
 Menor = P1
 if Menor > P2 then
    Menor = P2
 end

 if Menor > P3 then
    Menor = P3
 end

 -- Mostra qual item desse ser escolhido
 print("O item a ser comprado é o item de preço: R$" .. string.format("%.2f",tostring(Menor)))
