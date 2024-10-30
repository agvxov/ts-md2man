CFLAGS  := -Isource/
LDFLAGS := -ltree-sitter -ltree-sitter-markdown -lpcre

OUT := ts-md2man

main: source/main.tbsp
	tbsp -o object/main.tb.c source/main.tbsp
	${CC} ${CFLAGS} -o ${OUT} object/main.tb.c source/sds.c ${LDFLAGS}

test: main
	./${OUT} -o max.groff test/max.md
	man ./max.groff

clean:
	-${RM} object/*.c
	-${RM} ${OUT}

.PHONY: test clean
