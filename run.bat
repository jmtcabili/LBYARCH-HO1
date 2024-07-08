@echo off

nasm -f win64 asb.asm
gcc -c main.c -o main.obj -m64
gcc main.obj asb.obj -o main.exe -m64
main
