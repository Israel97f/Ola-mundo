--[[ Tendo como dados de entrada a altura de uma pessoa, construa um algoritmo que calcule seu peso ideal,
 usando a seguinte fórmula: (72.7*altura) - 58 ]]

 -- pega a altura fornecida pelo usuário
 io.write("Digite uma um altura em metros: ")
 Alt = tonumber(io.read())

 -- Calcula o peso  ideal em função da altura
 Peso = (72.7 * Alt) -58

 -- mostra o peso calculado
 print("O peso ideal para a altura " ..tostring(Alt) .. "m é " .. tostring(Peso) .. "kg")
