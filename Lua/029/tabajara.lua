 --[[
    As Organizações Tabajara resolveram dar um aumento de salário aos seus colaboradores e lhe 
    contrataram para desenvolver o programa que calculará os reajustes.

    Faça um programa que recebe o salário de um colaborador e o reajuste segundo o seguinte critério,
    baseado no salário atual:
    salários até R$ 280,00 (incluindo) : aumento de 20%
    salários entre R$ 280,00 e R$ 700,00 : aumento de 15%
    salários entre R$ 700,00 e R$ 1500,00 : aumento de 10%
    salários de R$ 1500,00 em diante : aumento de 5% Após o aumento ser realizado, informe na tela:
    o salário antes do reajuste;
    o percentual de aumento aplicado;
    o valor do aumento;
    o novo salário, após o aumento. 
 ]]
 -- recebe um número fornecido pelo usuário
 io.write("Digite seu salário: ")
 Salario = tonumber(io.read())


 -- processa os dados
 if Salario <= 280 then 
    Aumento = 20
 elseif Salario <= 700 then
    Aumento = 15
 elseif Salario < 1500 then
    Aumento = 10
 elseif Salario >= 1500 then
    Aumento = 5
 else
    Aumento = -1
 end
 
 Valor_Aumento = Salario * Aumento / 100 
 Novo_Salario = Salario + Valor_Aumento

 -- Exibe os dados
 print("salário antes do reajuste:    R$" .. string.format("%.2f", tostring(Salario)))
 print("percentual de aumento aplicado: " .. tostring(Aumento) .. "%")
 print("valor do aumento:             R$" .. string.format("%.2f", tostring(Valor_Aumento)))
 print("novo salário, após o aumento: R$" .. string.format("%.2f", tostring(Novo_Salario)))
