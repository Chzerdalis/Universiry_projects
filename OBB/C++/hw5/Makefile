CXX = g++
CXXFLAGS = -std=c++17 -Wall
LDFLAGS = -ltinyxml2

TARGET = final graphinterger
SRCS = final_main.cpp init_graph.cpp
OBJS = $(SRCS:.cpp=.o)

all: clean final graphinterger

final: final_main.o
	$(CXX) $(CXXFLAGS) -o $@ $^ $(LDFLAGS)

graphinterger: init_graph.o
	$(CXX) $(CXXFLAGS) -o $@ $^ $(LDFLAGS)

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

g:
	@for file in *.dot; do \
    	echo "Converting $$file to $${file%.dot}.png"; \
    	dot -Tpng $$file -o $${file%.dot}.png; \
	done

clean:
	rm -f $(TARGET) $(OBJS)