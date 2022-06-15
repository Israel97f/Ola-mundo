--[[
    Faça um programa para uma loja de tintas. O programa deverá pedir o tamanho em metros quadrados 
    da área a ser pintada. Considere que a cobertura da tinta é de 1 litro para cada 3 metros quadra-
    dos e que a tinta é vendida em latas de 18 litros, que custam R$ 80,00.
    Informe ao usuário a quantidades de latas de tinta a serem compradas e o preço total. 
]]

 -- Pede a área a ser pintada
 io.write("Digite a área da superfície a ser pintada: ")
 Area = tonumber(io.read())

 -- processa os dados
 Latas = (Area / 3) // 18
 if (Area / 3) % 18 ~= 0 then Latas = Latas + 1 end
 Pre = Latas * 80 

 -- Mostra os dados
 print("Deve ser compradas " .. tostring(Latas) .. " latas de tinta")
 print("O custo de " .. tostring(Latas) .. " latas de tinta é R$ " .. tostring(Pre))
