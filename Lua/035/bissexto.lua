-- Faça um Programa que peça um número correspondente a um determinado ano e em seguida informe se
-- este ano é ou não bissexto. 

-- pede um ano 
io.write("Digite um ano: ")
Ano = tonumber(io.read())

-- verifica se o ano digitado é bissexto
 if Ano % 4 == 0 and Ano % 100 ~= 0  or Ano % 400 == 0 then
    Mensagem = "é bissexto"

 else
    Mensagem = "Não é bissexto"
 end

 -- exibe a mensagem no terminal
 print(Mensagem)
 