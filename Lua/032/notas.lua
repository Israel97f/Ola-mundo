 --[[
    Faça um programa que lê as duas notas parciais obtidas por um aluno numa disciplina ao longo de 
    um semestre, e calcule a sua média. A atribuição de conceitos obedece à tabela abaixo:

      Média de Aproveitamento  Conceito
      Entre 9.0 e 10.0        A
      Entre 7.5 e 9.0         B
      Entre 6.0 e 7.5         C
      Entre 4.0 e 6.0         D
      Entre 4.0 e zero        E

    O algoritmo deve mostrar na tela as notas, a média, o conceito correspondente e a mensagem 
    “APROVADO” se o conceito for A, B ou C ou “REPROVADO” se o conceito for D ou E. 
 ]]

 -- Lê duas notas
 io.write("Digite a 1° nota: ")
 N1 = tonumber(io.read())
 io.write("Digite a 2° nota: ")
 N2 = tonumber(io.read())

 -- processa as nota
 Media = (N1 + N2) / 2

 if Media >= 9 then
    Con = "A"
 elseif Media >= 7.5 then
    Con = "B"
 elseif Media >= 6 then
    Con = "C"
 elseif Media >= 4 then
    Con = "D"
 else
    Con = "E"
 end

 if Media >= 6 then
    Aprovacao = "APROVADO"
 else 
    Aprovacao = "REPROVADO"
 end

 --mostra o resultado
 f = string.format
 print('_________________________________________________________')
 print(f("%-41s", "1° nota")..": ".. f("%9.2f", N1) )
 print(f("%-41s", "2° nota").. ": ".. f("%9.2f", N2))
 print(f("%-41s", "Média").. ": ".. f("%9.2f", Media))
 print(f("%-40s", "Conceito").. ": "..f("%9s", Con))
 print(f("%-42s", "Situação").. ": ".. f("%9s", Aprovacao))
