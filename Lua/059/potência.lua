-- Faça um programa que peça dois números, base e expoente, calcule e mostre o primeiro número elevado
-- ao segundo número. Não utilize a função de potência da linguagem. 

 -- pega dos número
 io.write("Digite a base: ")
 Base = tonumber(io.read())
 io.write("Digite o expoente: ")
 Exp = tonumber(io.read())

 -- calcula a potência
 Pot = 1
 for i = 1, Exp do
    Pot = Pot * Base
 end

 -- exibe o resultado
 print(Pot)
