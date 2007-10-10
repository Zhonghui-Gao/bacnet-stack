#Makefile to build unit tests
CC      = gcc
BASEDIR = .
DEFINES = -DBIG_ENDIAN=0 -DTEST -DTEST_BACINT
CFLAGS  = -Wall -Iinclude -Itest -g $(DEFINES)

TARGET = bacint

SRCS = src/bacint.c \
       src/bacstr.c \
       test/ctest.c

OBJS = ${SRCS:.c=.o}

all: ${TARGET}
 
${TARGET}: ${OBJS}
	${CC} -o $@ ${OBJS} 

.c.o:
	${CC} -c ${CFLAGS} $*.c -o $@
	
depend:
	rm -f .depend
	${CC} -MM ${CFLAGS} *.c >> .depend
	
clean:
	rm -rf ${OBJS} ${TARGET} 

include: .depend
