-- Faça um Programa que calcule a área de um quadrado, em seguida mostre o dobro desta área para o usuário. 

io.write("Digite o comprimento dos lados do quadrado: ")
Num = tonumber(io.read()) -- pega o comprimento dos lados de um quadrado

Valor = Num ^ 2 * 2 -- calcula a área do quadrado de lados Num e multiplicá por 2

print("O valor de 2 vezes a área do quadrado é " .. tostring(Valor)) -- mostra o valor calculado para o usuário
