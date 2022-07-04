 -- Faça um programa que receba dois números inteiros e gere os números inteiros que estão no intervalo
 -- compreendido por eles. 

 -- pega dois números
 io.write("Digite o primeiro número: ")
 N1 = tonumber(io.read())
 io.write("Digite o segundo número: ")
 N2 = tonumber(io.read())

 -- exibe os números compreendidos num intervalo definido
 for i = N1 + 1, N2 - 1, 1 do
    io.write(i .. " ")
 end
 print('')
 