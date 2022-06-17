-- Faça um Programa que leia três números e mostre o maior deles. 
 -- pegando valores
 io.write("digite um número: ")
 N1 = tonumber(io.read())
 io.write("digite mais um número: ")
 N2 = tonumber(io.read())
 io.write("digite outro número: ")
 N3 = tonumber(io.read())

 -- verifica o maior
 Maior = N1
 if Maior <  N2 then
    Maior = N2
 end

 if Maior < N3 then
    Maior = N3
 end

 -- mostra o maior
 print("O maior número é: " .. tostring(Maior))
 