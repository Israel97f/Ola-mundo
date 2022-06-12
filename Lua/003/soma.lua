-- Faça um Programa que peça dois números e imprima a soma. 

io.write("digite um número: ")
Num1 = tonumber(io.read()) -- pede um número

io.write("digete outro número: ")
Num2 = tonumber(io.read()) -- pede outro número

print("A soma dos numeros é " .." " ..tostring(Num1 + Num2))   -- exibe a soma dos números
