function SD_index = SorensenDice(x, y)
    
    SD_index = 2*length(intersect(x,y))/(length(x)+length(y));

end