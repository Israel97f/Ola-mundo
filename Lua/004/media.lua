-- Faça um Programa que peça as 4 notas bimestrais e mostre a média. 


-- pega quatro números fornecido pelo usuário
io.write("Digite a primeira nota: ")
N1 = tonumber(io.read())
io.write("Digite a segunda nota: ")
N2 = tonumber(io.read())
io.write("Digite a terceira nota: ")
N3 = tonumber(io.read())
io.write("Digite a quarta nota: ")
N4 = tonumber(io.read())

print("A média é " .. tostring((N1 + N2 + N3 + N4) / 4))  -- imprime a média dos números coletados na tela
