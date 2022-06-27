 --[[
    Faça um programa que faça 5 perguntas para uma pessoa sobre um crime. As perguntas são:

    "Telefonou para a vítima?"
    "Esteve no local do crime?"
    "Mora perto da vítima?"
    "Devia para a vítima?"
    "Já trabalhou com a vítima?" O programa deve no final emitir uma classificação sobre a participa-
    ção da pessoa no crime. Se a pessoa responder positivamente a 2 questões ela deve ser classificada
    como "Suspeita", entre 3 e 4 como "Cúmplice" e 5 como "Assassino". Caso contrário, ele será clas-
    sificado como "Inocente".
 ]]

 -- faz aas perguntas para o usuário
 io.write("Telefonou para a vítima?: ")
 Res1 = tostring(io.read())
 io.write("Esteve no local do crime?: ")
 Res2 = tostring(io.read())
 io.write("Mora perto da vítima?: ")
 Res3 = tostring(io.read())
 io.write("Devia para vítima?: ")
 Res4 = tostring(io.read())
 io.write("Já trabalhou com a vítima?: ")
 Res5 = tostring(io.read())

 -- verifica quantas resposta foram positivas
 Cont = 0
 if Res1 == "sim" then
    Cont = 1
 end

 if Res2 == "sim" then
    Cont = Cont + 1
 end

 if Res3 == "sim" then
    Cont = Cont + 1
 end

 if Res4 == "sim" then
    Cont = Cont + 1
 end

 if Res5 == "sim" then
    Cont = Cont + 1
 end
 
 -- faz a classificação
 if Cont == 5 then
    Classif = "Assassino"
 elseif Cont >= 3 then
    Classif = "Cúmplice"
 elseif Cont >= 2 then
    Classif = "Suspeita"
 else
    Classif = "Inocente"
 end

 -- exibe a classificação
 print(Classif)
