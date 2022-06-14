--[[
    Faça um Programa que peça a temperatura em graus Fahrenheit, transforme e mostre a temperatura em graus Celsius.

    C = 5 * ((F-32) / 9). 
]]

io.write("Digite a temperatura em Fahrenheit: ")
Temp = tonumber(io.read())  -- Pega uma temperatura em Fahrenheit fornecida pelo usuário

Tem_cel = (5 / 9) * (Temp - 32) -- faz a conversão da temperatura 
print("A temperatura " .. tostring(Temp) .. " em célcios é " .. tostring(Tem_cel)) -- printa o valor convertido
