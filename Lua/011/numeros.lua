--[[
    Faça um Programa que peça 2 números inteiros e um número real. Calcule e mostre:

    o produto do dobro do primeiro com metade do segundo.
    a soma do triplo do primeiro com o terceiro.
    o terceiro elevado ao cubo. 
]]

-- coleta os números do usuário
io.write("Digite um número inteiro: ")
N1 = tonumber(io.read())
io.write("Digite outro número inteiro: ")
N2 = tonumber(io.read())
io.write("Digite um número real: ")
N3 = tonumber(io.read())

-- Faz as operações necessárias
V1 = N1 * 2 * N2 / 2
V2 = (3 * N1) + N3
V3 = N3 ^ 3

-- Exibe os valores calculados
print(V1, V2, V3)
