-- Faça um Programa que calcule a área de um quadrado, em seguida mostre o dobro desta área para o usuário. 

io.write("Digite o comprimento dos lados do quadrado: ")
Num = tonumber(io.read()) -- pega o comprimento dos lados de um quadrado

Valor = Num ^ 2 * 2 -- calcula a área do quadrado de lados Num e mutiplica por 2

print("O valor de 2 vezes a área do quadrodo é " .. tostring(Valor)) -- mostar o valor calculado para o usuario

radiuss = 8

N = tostring(radiuss)