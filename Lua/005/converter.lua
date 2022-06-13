-- Faça um Programa que converta metros para centímetros. 

io.write("Digite o valor em metros que deseja converter: ")
Num =  tonumber(io.read()) -- pega um numero fornecido pelo usuário

print("O valor ".. tostring(Num) .. " corresponde a " .. tostring (Num * 100) .. " centímetros") -- imprime a conversão
