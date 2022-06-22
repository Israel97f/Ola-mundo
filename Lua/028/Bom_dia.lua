 -- Faça um Programa que pergunte em que turno você estuda. Peça para digitar M-matutino ou
 -- V-Vespertino ou N- Noturno. Imprima a mensagem "Bom Dia!", "Boa Tarde!" ou "Boa Noite!" ou 
 -- "Valor Inválido!", conforme o caso. 

 -- Pega uma letra fornecida pelo usuário
 io.write("Em que turno você estuda? digite M (Matutino), V (Vespertino) ou N (Noturno): ")
 Turno = string.sub(io.read(), 1, 1)

 if string.match("Mm", Turno) then
    Mensagem = "Bom Dia!"
 elseif string.match("Vv", Turno) then
    Mensagem = "Boa Tarde!"
 elseif string.match("Nn", Turno) then
    Mensagem = "Boa Noite" 
 else
    Mensagem = "Valor Invalido!"
 end

 -- Mostra a mensagem
 print(Mensagem)
