--[[ Faça um Programa que pergunte quanto você ganha por hora e o número de horas trabalhadas no mês.
Calcule e mostre o total do seu salário no referido mês. 
--]]

io.write("Quanto é o seu ganho por hora: ")
Valor = tonumber(io.read()) -- pega o um valor fornecido pelo usuário

io.write("Qantas horas você trabalha por mês: ")
Horas = tonumber(io.read()) -- pega um valor correspondente ao numero de horas trabalhadas 

Salario = Valor * Horas --  calcula o salário do usuário

print("O salário calculado é " .. tostring(Salario)) -- imprime o salário calculado 
