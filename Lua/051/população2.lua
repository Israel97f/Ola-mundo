 --[[
    Altere o programa anterior permitindo ao usuário informar as populações e as taxas de crescimento
    iniciais. Valide a entrada e permita repetir a operação. 
 ]]

 -- pede ao usuário e valida as informações necessárias 
 while true do
    io.write("Digite a população inicial da cidade A: ")
    Populacao_A = tonumber(io.read())
    io.write("Digite a população inicial de cidade B: ")
    Populacao_B = tonumber(io.read())
    io.write("Digite a taxa de crescimento da cidade A em %: ")
    Taxa_A = tonumber(io.read())
    io.write("Digite a taxa de crescimento da cidade B em %: ")
    Taxa_B = tonumber(io.read())

    if type(Populacao_B) == "number" and type(Populacao_A) == "number"  then
      if type(Taxa_A) == "number" and type(Taxa_B) == "number" then
         if Populacao_A > 0 and Populacao_B > 0 and Taxa_A > 0 and Taxa_B > 0 then
            break
         else
            print("uma a mais informações não são maiores que zero tente novamente")
         end
      else
         print("um ou mais valores não são números, tente novamente")
      end
    else
      print("um ou mais valores não são números, tente novamente")
    end
 end
 
 -- calcula os anos necessários para que a população menor ultrapasse a maior
 if Populacao_A >= Populacao_B then
   Maior = Populacao_A
   Menor = Populacao_B
   TaxaMaior = Taxa_A
   TAxaMenor = Taxa_B
 else
   Maior = Populacao_B
   Menor = Populacao_A
   TaxaMaior = Taxa_B
   TaxaMenor = Taxa_A
 end
 if TaxaMaior < TaxaMenor then
   
   Anos = 0
   while true do
      Maior = Maior + Maior * TaxaMaior/100
      Menor = Menor + Menor * TaxaMenor/100
      Anos = Anos + 1
      print(Maior, Menor, Anos)
      if Maior <= Menor then
         break
      end
   end
 else
   Anos = "A população maior nunca poderá ser ultrapassada"
 end
 -- exibe a quantidade de anos
 print(Anos)
 