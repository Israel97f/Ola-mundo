--[[
    O Hipermercado Tabajara está com uma promoção de carnes que é imperdível. Confira:

                          Até 5 Kg           Acima de 5 Kg
    File Duplo      R$ 4,90 por Kg          R$ 5,80 por Kg
    Alcatra         R$ 5,90 por Kg          R$ 6,80 por Kg
    Picanha         R$ 6,90 por Kg          R$ 7,80 por Kg

    Para atender a todos os clientes, cada cliente poderá levar apenas um dos tipos de carne da promoção,
    porém não há limites para a quantidade de carne por cliente. Se compra for feita no cartão Tabajara
    o cliente receberá ainda um desconto de 5% sobre o total da compra. Escreva um programa que peça o
    tipo e a quantidade de carne comprada pelo usuário e gere um cupom fiscal, contendo as informações
    da compra: tipo e quantidade de carne, preço total, tipo de pagamento, valor do desconto e valor 
    a pagar.
]]

 -- pega as informações necessárias
 io.write("Digite o tipo de carne desejada F-file, A-alcatra ou P-picanha: ")
 Tipo = tostring(io.read())
 io.write("Digite quantos quilos deseja: ")
 Quantidade = tonumber(io.read())
 io.write("Escolha a forma de pagamento C-Cartão Tabajara ou D-dinheiro: ")
 Tipo_Pagamento = tostring(io.read())

 -- calcula o custo


 if Quantidade <= 5 then
    Op = 1
 else
    Op = 2
 end

 Valores = {{4.90, 5.80}, {5.90, 6.80}, {6.90, 7.80}}

 if Tipo == "F" then
    Pre = Valores[1][Op]
    Tipo = "File Duplo"
 elseif Tipo == "A" then
    Pre = Valores[2][Op]
    Tipo = "Alcatra"
 elseif Tipo == "P" then
    Tipo = "Picanha"
    Pre = Valores[3][Op]
 else
    print("tipo invalido")
    Pre = 0
 end

 Total = Pre * Quantidade
 if Tipo_Pagamento == "C" then
    Des = Total * 5/100
    Tipo_Pagamento = "Cartão tabajara"
 else
    Des = 0
    Tipo_Pagamento = "Em dinheiro"
 end

 -- exibe a nota
 f = string.format
 print("------------------------------------------------------")
 print(f("%33s", "Cupom fiscal"))
 print("------------------------------------------------------")
 print(f("%-40s%11.2f%3s", "Tipo de carne: " .. Tipo, Quantidade, " Kg"))
 print(f("%-41s%5s%9.2f", "Preço total:", "R$", Total))
 print(f("%-38s%16s", "tipo de pagamento: ", Tipo_Pagamento))
 print(f("%-40s%5s%9.2f", "Valor do desconto: ", "R$", -Des))
 print(f("%-40s%5s%9.2f", "valor a pagar: ", "R$", Total - Des))
