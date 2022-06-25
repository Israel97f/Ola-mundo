 --[[
    Faça um Programa para leitura de três notas parciais de um aluno. O programa deve calcular a média 
    alcançada por aluno e presentar:

    A mensagem "Aprovado", se a média for maior ou igual a 7, com a respectiva média alcançada;
    A mensagem "Reprovado", se a média for menor do que 7, com a respectiva média alcançada;
    A mensagem "Aprovado com Distinção", se a média for igual a 10. 
 ]]

 -- pede ao usuário três notas parciais
 io.write("digite a 1° nota: ")
 N1 = tonumber(io.read())
 io.write("Digite a 2° nota: ")
 N2 = tonumber(io.read())
 io.write("Digite a 3° nota: ")
 N3 = tonumber(io.read())

 -- calcula a media
 Media = (N1 + N2 + N3 )/ 3

 -- verifica a aprovação do aluno
 if Media == 10 then
    Mensagem = "Aprovado com Distinção"
 elseif Media >= 7 then
    Mensagem = "Aprovado " .. Media
 else
    Mensagem = "Reprovado " .. Media
 end

 -- exibe a mensagem
 print(Mensagem)
