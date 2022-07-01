--[[
    Supondo que a população de um país A seja da ordem de 80000 habitantes com uma taxa anual de
    crescimento de 3% e que a população de B seja 200000 habitantes com uma taxa de crescimento de 
    1.5%. Faça um programa que calcule e escreva o número de anos necessários para que a população 
    do país A ultrapasse ou iguale a população do país B, mantidas as taxas de crescimento. 
]]

 -- calcula o número de anos necessário para igualar as populações
 Pop_A = 80000
 Pop_B = 200000
 Anos = 0

 while true do

    Pop_A = Pop_A + Pop_A * 3/100
    Pop_B= Pop_B + Pop_B * 15/1000
    Anos = Anos + 1

    if Pop_A >= Pop_B then
        print(Anos)
        break
    end
 end
