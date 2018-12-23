@echo off

set name="Example"

set path=rgbds\

rgbasm -o %name%.o %name%.asm 
rgblink -o %name%.gb %name%.o 
rgbfix -v -p 0 %name%.gb

echo Done.

del *.o

pause
