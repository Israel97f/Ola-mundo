-- Faça um Programa que peça a temperatura em graus Celsius, transforme e mostre em graus Fahrenheit. 

io.write("Digite a temperatura em Celsius: ")
Tem = tonumber(io.read()) -- pega a temperatura em Celsius fornecida pelo usuário

Tem_F = (Tem * 9 / 5) + 32 -- converte a temperatura

print("A temperatura " .. tostring(Tem) .. " em convertida para Fahrenheit é " .. tonumber(Tem_F)) --exibe a temperatura convertida
