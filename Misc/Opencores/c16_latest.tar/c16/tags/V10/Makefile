
all:	test

loader:
	gcc -c loader.c
	make -C .\compiler loader
	make -C .\asm loader
	make -C .\memory loader
#	make -C .\sim loader

test:
	gcc -c test.c
	make -C .\compiler test
	make -C .\asm test
	make -C .\memory test
#	make -C .\sim test

rtos:
	gcc -c rtos.c
	make -C .\compiler rtos
	make -C .\asm rtos
	make -C .\memory rtos

config:

clean:

