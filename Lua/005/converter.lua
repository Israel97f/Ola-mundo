-- Faça um Programa que converta metros para centímetros. 

io.write("Digite o valor em metros que deseja converter: ")
Num =  tonumber(io.read()) -- perga um numero fornecido pelo usuario

print("O valor ".. tostring(Num) .. " corresponde a " .. tostring (Num * 100) .. " centimetros") -- imprime a converssssão
