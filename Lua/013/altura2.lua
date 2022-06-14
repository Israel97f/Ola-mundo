--[[
    Tendo como dado de entrada a altura (h) de uma pessoa,
    construa um algoritmo que calcule seu peso ideal, utilizando as seguintes fórmulas:

    Para homens: (72.7*h) - 58
    Para mulheres: (62.1*h) - 44.7 
]]

 -- pega uma altura fornecida pelo usuário
 io.write("digite uma altura: ")
 h = tonumber(io.read())
 
 -- calcula o peso ideal para as devidas situações
 P_h = 72.7 * h - 58
 P_m = 62.1 * h - 44.7

 -- mostra o peso para o usuário
print(
    "O peso ideal para a altura de " .. tostring(h) .. " é " .. tostring(P_h) ..
    "kg para homens é " .. tostring(P_m) .."kg para mulheres"
) 
