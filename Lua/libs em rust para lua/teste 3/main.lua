local toca_som = require("toca_som")

local path = os.getenv("OS") and "C:/Users/Israe/Music/Tema de abertura da série Smallville.mp3" or 
'/home/israel/Música/Mortticia - Running Up That Hill (A Deal With God) [Kate Bush Cover] (MUSIC VIDEO).mp3'

toca_som.rode(path)
