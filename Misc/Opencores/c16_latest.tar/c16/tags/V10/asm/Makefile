
HDR	:= assembler_bison.cc.h Node.hh Backend.hh Name.hh
OBJ	:= assembler.o assembler_bison.o assembler_flex.o

all:	test

loader:	assembler.exe
	assembler ../loader.asm ../loader.bin

test:	assembler.exe
	assembler ../test.asm ../test.bin

rtos:	assembler.exe
	assembler ../rtos.asm ../rtos.bin

assembler.exe:	$(OBJ)
	gcc -o $@ $(OBJ)

%.o:	%.cc $(HDR)
	gcc -c -o $@ $<

assembler_bison.cc:	assembler.bison
	bison -d -v -o $@ $<

assembler_bison.cc.h:	assembler.bison
	bison -d -v -o ansi_bison.cc $<

assembler_flex.cc:	assembler.flex assembler_bison.cc.h
	flex -o$@ $<

clean:

