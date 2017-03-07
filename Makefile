CC=g++

SOURCES_DIR=./src
INCLUDES_DIR=./include
LIBS_DIR=./lib
OBJS_DIR=./obj

CFLAGS=-I${INCLUDES_DIR} -c -Wall -fPIC -std=c++0x
LDFLAGS=-shared -lpthread



SOURCES=$(wildcard ${SOURCES_DIR}/*.cc)

NOTDIR=$(notdir ${SOURCES})
SUBST=$(patsubst %.cc, %.o, ${NOTDIR})
OBJS=$(addprefix ${OBJS_DIR}/, ${SUBST})

LIB=${LIBS_DIR}/libecho.so



${LIB}:${OBJS}
	${CC} -o $@ $^ ${LDFLAGS}

${OBJS_DIR}/%.o:${SOURCES_DIR}/%.cc
	${CC} -o $@ $< ${CFLAGS}

.PHONY:clean install
clean:
	rm -f ${OBJS}
	rm -f ${LIB}
install:
	mkdir -p /usr/local/include/echo
	cp -rf ${LIB} /usr/local/lib
	cp -rf ${INCLUDES_DIR}/*.h /usr/local/include/echo
