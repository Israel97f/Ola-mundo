--[[
    Uma fruteira está vendendo frutas com a seguinte tabela de preços:

                          Até 5 Kg           Acima de 5 Kg
    Morango         R$ 2,50 por Kg          R$ 2,20 por Kg
    Maçã            R$ 1,80 por Kg          R$ 1,50 por Kg

    Se o cliente comprar mais de 8 Kg em frutas ou o valor total da compra ultrapassar R$ 25,00,
    receberá ainda um desconto de 10% sobre este total. Escreva um algoritmo para ler a quantidade
    (em Kg) de morangos e a quantidade (em Kg) de maças adquiridas e escreva o valor a ser pago pelo
    cliente.
]]

 -- pega as informações necessárias
 io.write("Digite quantos quilos de maçã deseja: ")
 Mac = tonumber(io.read())
 io.write("Digite quantos quilos de morango deseja: ")
 Mor = tonumber(io.read())

 -- faz o calculo do preço
 if Mac <= 5 then
    PreMac = 1.80
 else
    PreMac = 1.50
 end

 if Mor <= 5 then
    PreMor = 2.50
 else
    PreMor = 2.20
 end

 TotalPre = PreMac * Mac + PreMor * Mor

 if (Mac + Mor) >= 8 or TotalPre > 25 then
    TotalPre = TotalPre * (1 - 10/100 ) 
 end

 -- Exibe o presso final ao usuário
 print("O total da compra foi de R$" .. string.format("%.2f", TotalPre))
