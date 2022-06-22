--[[
    Faça um Programa que peça os 3 lados de um triângulo. O programa deverá informar se os valores 
    podem ser um triângulo. Indique, caso os lados formem um triângulo, se o mesmo é: equilátero, 
    isósceles ou escaleno.

    Dicas:
    Três lados formam um triângulo quando a soma de quaisquer dois lados for maior que o terceiro;
    Triângulo Equilátero: três lados iguais;
    Triângulo Isósceles: quaisquer dois lados iguais;
    Triângulo Escaleno: três lados diferentes; 
]]

 -- pede três comprimentos de lado ao usuário
 io.write("Digite o comprimento do lado a: ")
 a = tonumber(io.read())
 io.write("Digite o comprimento do lado b: ")
 b = tonumber(io.read())
 io.write("Digite o comprimento do lado c: ")
 c = tonumber(io.read())

 -- verifica se o triângulo e possível
 if a + b > c and a + c > b and b + c > a then
    if a == b and a == c then
        Triangulo = "Equilátero"
    elseif a == b or b == c or a == c then
        Triangulo = "Isósceles"
    else
        Triangulo = "Escaleno"
    end

    Mensagem = "Os lados digitados formam um triangulo " .. Triangulo
 else
    Mensagem = "Os lados digitados não formam um triângulo"
 end

 -- exibe a mensagem para o usuário
 print(Mensagem)
