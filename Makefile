UNAME_S := $(shell uname -s)

ifeq ($(UNAME_S), Darwin)
DGSH_ASSEMBLY_FILE=dgsh-macho.s
else
DGSH_ASSEMBLY_FILE=dgsh-elf.s
endif


lib_LIBRARIES = libdgsh.a
libdgsh_a_SOURCES = negotiate.c $(DGSH_ASSEMBLY_FILE)

dgsh_tee_SOURCES = dgsh-tee.c

dgsh_tee_LDADD = libdgsh.a

dgsh-tee:
	gcc -O3 $(dgsh_tee_SOURCES) $(libdgsh_a_SOURCES)  $(DGSH_ASSEMBLY_FILE) -Wall

clean:
	rm -f dgsh-tee