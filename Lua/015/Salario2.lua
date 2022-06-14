--[[
    Faça um Programa que pergunte quanto você ganha por hora e o número de horas trabalhadas no mês.
    Calcule e mostre o total do seu salário no referido mês, sabendo-se que são descontados 11% 
    para o Imposto de Renda, 8% para o INSS e 5% para o sindicato, faça um programa que nos dê:

    salário bruto.
    quanto pagou ao INSS.
    quanto pagou ao sindicato.
    o salário líquido.
    calcule os descontos e o salário líquido
]]

 -- Pega os dados necessários do usuário
 io.write("Digite o rendimento por hora: ")
 Rend = tonumber(io.read()) 
 io.write("Digite o número de horas trabalhadas no mês: ")
 Horas = tonumber(io.read())

 -- Processa os dados
 Salario_B = Rend * Horas
 Imposto_R = Salario_B * 11 / 100
 Inss = Salario_B * 8 / 100
 Taxa_Sin = Salario_B * 5 / 100
 Salario_Li = Salario_B - Imposto_R - Inss - Taxa_Sin

 -- exibe os dados
 print("+ Salário Bruto : R$ " .. tostring(Salario_B))
 print("- IR (11%) : R$ " .. tostring(Imposto_R))
 print("- INSS (8%) : R$ " .. tostring(Inss))
 print("- Sindicato (5%) : R$ " .. tostring(Taxa_Sin))
 print("Salário Liquido : R$ " .. tostring(Salario_Li))
