CXX = c++
CXXLD = c++
CXXFLAGS = -Wall -Wextra -I. -std=c++11
LDFLAGS = -lcrypto++

.cpp.o:
	$(CXX) $(CXXFLAGS) -c -o $@ $<

oathgen: main.o alt_base32/alt_base32.o
	$(CXXLD) -o oathgen main.o alt_base32/alt_base32.o $(LDFLAGS)

clean:
	find . -name \*.o -delete
	rm -f oathgen

all: oathgen

.PHONY: clean all
