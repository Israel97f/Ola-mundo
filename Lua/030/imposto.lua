 --[[
    faça um programa para o cálculo de uma folha de pagamento, sabendo que os descontos são do Imposto
    de Renda, que depende do salário bruto (conforme tabela abaixo) e 3% para o Sindicato e que o 
    FGTS corresponde a 11% do Salário Bruto, mas não é descontado (é a empresa que deposita). 
    O Salário Líquido corresponde ao Salário Bruto menos os descontos. O programa deverá pedir ao 
    usuário o valor da sua hora e a quantidade de horas trabalhadas no mês.

    Desconto do IR:
    Salário Bruto até 900 (inclusive) - isento
    Salário Bruto até 1500 (inclusive) - desconto de 5%
    Salário Bruto até 2500 (inclusive) - desconto de 10%
    Salário Bruto acima de 2500 - desconto de 20% Imprima na tela as informações, dispostas conforme
    o exemplo abaixo. No exemplo o valor da hora é 5 e a quantidade de hora é 220.

            Salário Bruto: (5 * 220)        : R$ 1100,00
            (-) IR (5%)                     : R$   55,00
            (-) INSS ( 10%)                 : R$  110,00
            FGTS (11%)                      : R$  121,00
            Total de descontos              : R$  165,00
            Salário Liquido                 : R$  935,00
 ]]

 -- pega as informações necessárias
 io.write("Digite o valor por hora trabalhada: ")
 Valor = tonumber(io.read())
 io.write("Digite o número de horas trabalhadas: ")
 Horas = tonumber(io.read())

 -- processa os dados
 Salario_Bruto = Valor * Horas

 if Salario_Bruto <= 900 then
    IR = 0
 elseif Salario_Bruto <= 1500 then
    IR = 5
 elseif Salario_Bruto <= 2500 then
    IR = 10
 else
    IR = 20
 end
 FGTS = Salario_Bruto * 11/100
 INSS = Salario_Bruto * 10/100
 Descontos = INSS + IR/100 * Salario_Bruto

 -- exibe as informações
 f = string.format
 print(f("%-41s", "Salário bruto ".. "(".. Valor .." * ".. Horas ..")") ..": R$".. f("%10.2f", Salario_Bruto))
 print(f("%-40s", "(-) IR " .. "(".. IR .."%)") .. ": R$".. f("%10.2f", Salario_Bruto * IR/100))
 print(f("%-40s", "(-) INSS (10%)" )..": R$" ..f("%10.2f", INSS))
 print(f("%-40s", "FGTS (11%)") .. ": R$" .. f("%10.2f", FGTS))
 print(f("%-40s", "Total de descontos") .. ": R$" .. f("%10.2f", Descontos))
 print(f("%-41s", "Salário Liquido") .. ": R$" .. f("%10.2f", Salario_Bruto - Descontos))
