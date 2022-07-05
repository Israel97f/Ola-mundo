 -- Altere o programa anterior para mostrar no final a soma dos números. 
 
 -- pede dois números
 io.write("Digite o 1° número: ")
 N1 = tonumber(io.read())
 io.write("Digite o 2° número:  ")
 N2 = tonumber(io.read())

 -- exibe os números compêndios entre os números informados
 Maior = N1 
 Menor = N2
 if N2 >= Maior then
    Maior = N2
    Menor = N1
 end

 -- gera os números entre Menor e Menor
 Soma = 0
 for i = Menor + 1, Maior - 1 do
    Soma = Soma + i
 end 

 -- exibe a soma dos números
 print(Soma)
 