--[[
    Faça um Programa para uma loja de tintas. O programa deverá pedir o tamanho em metros quadrados da
    área a ser pintada. Considere que a cobertura da tinta é de 1 litro para cada 6 metros quadrados e
    que a tinta é vendida em latas de 18 litros, que custam R$ 80,00 ou em galões de 3,6 litros, 
    que custam R$ 25,00.

    Informe ao usuário as quantidades de tinta a serem compradas e os respectivos preços em 3 situações:
    comprar apenas latas de 18 litros;
    comprar apenas galões de 3,6 litros;
    misturar latas e galões, de forma que o desperdício de tinta seja menor. Acrescente 10% de folga
    e sempre arredonde os valores para cima, isto é, considere latas cheias. 
]]

 -- Pega a área fornecida pelo usuário 
 io.write("Digite a área a ser pintada: ")
 Area = tonumber(io.read())

 -- processando os dados
 Litros = Area / 6
 if Litros % 18 ~= 0 then
    Latas = Litros // 18 + 1
 else
    Latas = Litros // 18
 end
 Pre1 = Latas * 80

 if Litros * 10 % 36 ~= 0 then -- resto da divisão retornando 3.6 ao invés de 0
    Galoes = Litros // 3.6 + 1
 else
    Galoes = Litros // 3.6
 end
 Pre2 = Galoes * 25

 Litros = Litros * 1.1  -- aumenta em 10% o quantidade de litros
 NLa = Litros // 18
 NGa = (Litros % 18) // 3.6 
 print(Litros)
 if (Litros % 18 * 10) % 36 == 0 then
    Pre3 = NLa * 80 + NGa * 25
    print(1)
 else
    NGa = NGa + 1
    Pre3 = NLa * 80 + (NGa) * 25
    print(2)
 end

 -- Exibe os dados para o usuário
 print("Para pintar a área informada precisara de ".. tostring(Latas) .. " Latas com custo de R$ " .. tostring(Pre1))
 print("Para pintar a área informada precisara de " .. tostring(Galoes) .." Galões com custo de R$ " .. tostring(Pre2))
 print("Precisara de " .. tostring(NLa) .. " latas é " .. tostring(NGa) .. " Galões com custo total de R$ " .. tostring(Pre3))
 