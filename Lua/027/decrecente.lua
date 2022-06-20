 -- Faça um Programa que leia três números e mostre-os em ordem decrescente. 
 
 -- pega três números
 io.write("Digite um número: ")
 N1 = tonumber(io.read())
 io.write("Digite outro número: ")
 N2 = tonumber(io.read())
 io.write("Digite mais um número: ")
 N3 = tonumber(io.read())

 -- verifica o maior e o menor numero
 Maior = N1
 Menor = N1
 Medio = N1

 if Maior < N2 then
    Maior = N2
 else
    Menor = N2
 end

 if Maior < N3 then
    Medio = Maior
    Maior = N3
 else
    if Menor > N3 then 
        Medio = Menor
        Menor = N3
    else
        Medio = N3
    end
 end

 -- Mostrar os números em ordem decrescente
 print("Os números em ordem decrescente são: " .. tostring(Maior).." ".. tostring(Medio) .." ".. tostring(Menor))
