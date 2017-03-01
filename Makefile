CC=g++

SOURCES_DIR=./src
INCLUDES_DIR=./include
LIBS_DIR=./lib
OBJS_DIR=./obj

# 只需要根据工程子目录的组织以及命名情况，以及需要添加哪些编译参数，添加哪些动态库，对以下两个变量作出修改。
CFLAGS=-I$(INCLUDES_DIR) -c -Wall -fPIC -std=c++0x
LDFLAGS=-shared -lpthread



SOURCES=$(wildcard $(SOURCES_DIR)/*.cc)

NOTDIR=$(notdir $(SOURCES))
SUBST=$(patsubst %.cc, %.o, $(NOTDIR))
OBJS=$(addprefix $(OBJS_DIR)/, $(SUBST))

LIB=$(LIBS_DIR)/libecho.so



$(LIB):$(OBJS)
	$(CC) $(LDFLAGS) -o $@ $^

$(OBJS_DIR)/%.o:$(SOURCES_DIR)/%.cc
	$(CC) $(CFLAGS) -o $@ $<



.PHONY:clean run
clean:
	rm -f $(OBJS_DIR)/*.o
	rm -f $(LIBS_DIR)/*
run:
	$(BIN)
