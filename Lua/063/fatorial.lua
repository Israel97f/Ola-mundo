 -- Faça um programa que calcule o fatorial de um número inteiro fornecido pelo usuário.
 -- Ex.: 5!=5.4.3.2.1=120 

 -- pega um número fornecido pelo usuário
 io.write("Deseja calcular o fatorial de qual número: ")
 Nf = tonumber(io.read())

 -- calcula o fatorial de Nf
 Fatorial = 1
 for i = Nf, 1, -1 do
    Fatorial = Fatorial * i
 end

 -- exibe o fatorial calculado
 print(Fatorial)
