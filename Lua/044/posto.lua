 --[[
    Um posto está vendendo combustíveis com a seguinte tabela de descontos:

    Álcool:
    até 20 litros, desconto de 3% por litro
    acima de 20 litros, desconto de 5% por litro
    Gasolina:
    até 20 litros, desconto de 4% por litro
    acima de 20 litros, desconto de 6% por litro Escreva um algoritmo que leia o número de litros
    vendidos, o tipo de combustível (codificado da seguinte forma: A-álcool, G-gasolina), calcule e
    imprima o valor a ser pago pelo cliente sabendo-se que o preço do litro da gasolina é R$ 2,50 o
    preço do litro do álcool é R$ 1,90. 
 ]]

 -- pega as informações necessárias
 io.write("Digite quantos litros deseja comprar: ")
 Litros = tonumber(io.read())
 io.write("Qual combustível deseja compra A-álcool ou G-gasoline?: ")
 Combustivel = tostring(io.read())

 -- Calcula o preço
 if Combustivel == "G" then
    Combustivel = "gasolina"
    Pre = 2.50
    Des = {4, 6}
 elseif Combustivel == "A" then
    Combustivel = "álcool"
    Pre = 1.90
    Des = {3, 5}
 else
    print("tipo de combustível invalido")
    Pre = -1
    Des = {-1, -1}
 end

 if Litros > 20 then
    Des = Des[2]
 elseif Litros <= 20 and Litros >= 0 then
    Des = Des[1]
 else
    print("valor invalido")
    Litros = -1
 end

 -- exibe o preço
 if Litros ~= -1 and Pre ~= -1 then
    Total = Litros * Pre * (1 - Des / 100)
    print("O custo de " .. Litros .. " Litros de " .. Combustivel .. " é R$" .. string.format("%.2f", Total))
 end
