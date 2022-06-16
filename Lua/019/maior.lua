-- Faça um Programa que peça dois números e imprima o maior deles. 

 -- pega dois números
 io.write("Digite um número: ")
 N1 = tonumber(io.read())
 io.write("Digite outro número: ")
 N2 = tonumber(io.read())

 -- verifica o maior dos números
 if N1 > N2 then Maior = N1 else Maior = N2 end

 -- mostra o resultado
 print("O maior numero é " .. tostring(Maior))
