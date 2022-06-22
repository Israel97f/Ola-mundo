--[[
    Faça um programa que calcule as raízes de uma equação do segundo grau, na forma ax2 + bx + c.
    O programa deverá pedir os valores de a, b e c e fazer as consistências, informando ao usuário nas
    seguintes situações:

    Se o usuário informar o valor de A igual a zero, a equação não é do segundo grau e o programa não 
    deve fazer pedir os demais valores, sendo encerrado;
    Se o delta calculado for negativo, a equação não possui raízes reais. Informe ao usuário e
    encerre o programa;
    Se o delta calculado for igual a zero a equação possui apenas uma raiz real;
    informe-a ao usuário;
    Se o delta for positivo, a equação possui duas raiz reais; informe-as ao usuário; 
]]

 -- pede ao usuário que forneça os coeficientes da equação
 io.write("Digite o coeficiente A da equação: ")
 A = tonumber(io.read())

 if A ~= 0 then
    io.write("Digite o Coeficiente B da equação: ")
    B = tonumber(io.read())
    io.write("Digite o Coeficiente C da equação: ")
    C = tonumber(io.read())

    Delta = B ^ 2 - 4 * A * C

    if Delta < 0 then
        print ("Essa equação não possui raízes reais")
    else
        if Delta == 0 then
            local raiz1 = -B/(2 * A)
            print("Essa equação possui apenas um raiz real que é " .. raiz1)
        else
            local raiz1 =  (-B + Delta ^ (1/2))/(2 * A)
            local raiz2 = (-B - Delta ^ (1/2))/(2 * A)
            print("Essa equação possui duas raízes reais que são " .. raiz1 .. " e ".. raiz2)
        end
    end
 else
    print("Essa não é uma equação do segundo grau")
 end
