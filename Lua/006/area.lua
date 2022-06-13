-- Faça um Programa que peça o raio de um círculo, calcule e mostre sua área. 

io.write("digite o raio do circulo que deseja calcular a área: ")
Raio = tonumber(io.read()) -- pega um valor fornecido pelo usuario

Area = math.pi * Raio ^ 2

print("A área do círculo de raio " .. tostring(Raio) .. " é " .. tostring(Area)) -- imprime a área do circulo de raio fornecido pelo usuario
