01:
	gcc -o bin/solution01 src/solution01.c -g -O3 
	bin/solution01 < input01.txt
	@echo DONE

02:
	gcc -o bin/solution02 src/solution02.c -g -O3
	bin/solution02
	@echo DONE

fsan:
	gcc -o bin/solution01 src/solution01.c -g -O3 -fsanitize=address
	bin/solution01 < input01.txt
	@echo DONE
