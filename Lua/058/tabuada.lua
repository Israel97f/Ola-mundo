 --[[
    Desenvolva um gerador de tabuada, capaz de gerar a tabuada de qualquer número inteiro entre 1 a 10.
    O usuário deve informar de qual numero ele deseja ver a tabuada. A saída deve ser conforme o 
    exemplo abaixo:

    Tabuada de 5:
    5 X 1 = 5
    5 X 2 = 10
    ...
    5 X 10 = 50
 ]]

 -- pede o numero a ser mostrado a tabuada
 io.write("Digite um número entre 1 e 10: ")
 N1 = tonumber(io.read())

 -- exibe a tabuada do número informado
 print("Tabuada do " .. N1)
 for i = 1, 10 do
    print(string.format("%-2i%-2s%-2i%3s%-3i", N1 ,"X",  i, " = ", i * N1))
 end