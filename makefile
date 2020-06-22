all: bin/Geometry

bin/Geometry: build/src/main.o build/src/Figure.o build/src/Output.o build/src/Pars.o
	g++ -Wall -Werror build/src/main.o build/src/Figure.o build/src/Output.o build/src/Pars.o -o bin/Geometry -lm

build/src/main.o: src/main.cpp
	g++ -Wall -Werror -c src/main.cpp -o build/src/main.o

build/src/Figure.o: src/Figure.cpp
	g++ -Wall -Werror -c src/Figure.cpp -o build/src/Figure.o

build/src/Output.o: src/Output.cpp
	g++ -Wall -Werror -c src/Output.cpp -o build/src/Output.o

build/src/Pars.o: src/Pars.cpp
	g++ -Wall -Werror -c src/Pars.cpp -o build/src/Pars.o

.PHONY: clean test

GTEST_LIB_DIR = thirdparty/googletest

USER_DIR = src

USER_DIR_O = build/test

USER_DIR_b = bin

CPPFLAGS += -isystem thirdparty/googletest/include

CXXFLAGS += -g -Wall -Wextra -pthread -std=c++11

GTEST_LIBS = libgtest.a libgtest_main.a

TESTS = Pars_unittest.cpp

GTEST_HEADERS = $(GTEST_LIB_DIR)/include/gtest/*.h \
                $(GTEST_LIB_DIR)/include/gtest/internal/*.h
                
GTEST_SRCS_ = $(GTEST_LIB_DIR)/src/*.cc $(GTEST_LIB_DIR)/src/*.h $(GTEST_HEADERS)	

$(GTEST_LIB_DIR)/lib/gtest-all.o : $(GTEST_SRCS_)
	$(CXX) $(CPPFLAGS) -I$(GTEST_LIB_DIR) $(CXXFLAGS) -c \
            $(GTEST_LIB_DIR)/src/gtest-all.cc -o $(GTEST_LIB_DIR)/lib/gtest-all.o

$(GTEST_LIB_DIR)/lib/gtest_main.o : $(GTEST_SRCS_)
	$(CXX) $(CPPFLAGS) -I$(GTEST_LIB_DIR) $(CXXFLAGS) -c \
            $(GTEST_LIB_DIR)/src/gtest_main.cc -o $(GTEST_LIB_DIR)/lib/gtest_main.o

$(GTEST_LIB_DIR)/lib/libgtest.a : $(GTEST_LIB_DIR)/lib/gtest-all.o
	$(AR) $(ARFLAGS) $@ $^

$(GTEST_LIB_DIR)/lib/libgtest_main.a : $(GTEST_LIB_DIR)/lib/gtest-all.o $(GTEST_LIB_DIR)/lib/gtest_main.o
	$(AR) $(ARFLAGS) $@ $^               

test:  $(GTEST_LIB_DIR)/lib/libgtest_main.a $(GTEST_LIB_DIR)/lib/libgtest.a $(TESTS)

$(TESTS) : $(USER_DIR_O)/Pars.o $(USER_DIR_O)/Pars_unittest.o
	$(CXX) $(CPPFLAGS) $(CXXFLAGS) -L$(GTEST_LIB_DIR)/lib -lgtest_main -lpthread $^ -o $(USER_DIR_b)/Test

$(USER_DIR_O)/Pars_unittest.o : test/Pars_unittest.cpp \
                     $(USER_DIR)/Pars.hpp $(GTEST_HEADERS)
	$(CXX) $(CPPFLAGS) $(CXXFLAGS) -c test/Pars_unittest.cpp -o $@

$(USER_DIR_O)/Pars.o : $(USER_DIR)/Pars.cpp $(USER_DIR)/Pars.hpp $(GTEST_HEADERS)
	$(CXX) $(CPPFLAGS) $(CXXFLAGS) -c $(USER_DIR)/Pars.cpp -o $@


clean:
	rm -rf build/src/*.o build/test/*.o bin/Geometry bin/Test
