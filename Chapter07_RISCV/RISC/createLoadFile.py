import numpy as np

with open("loadHEX.txt", "a") as f:
    for i in range(16):
        for j in range(16):
        
            if i == 10:
                i = "a"
        
            if j == 10:
                j = "a"

            if i == 11:
                i = "b"
        
            if j == 11:
                j = "b"

            if i == 12:
                i = "c"
        
            if j == 12:
                j = "c"

            if i == 13:
                i = "d"
        
            if j == 13:
                j = "d"

            if i == 14:
                i = "e"
        
            if j == 14:
                j = "e"

            if i == 15:
                i = "f"
        
            if j == 15:
                j = "f"

            f.write("0x"+str(i)+str(j)+"\n")
