LIBRARY=libunity.a

OBJS=$(patsubst %.c, %.o, $(wildcard *.c))

$(LIBRARY): $(OBJS)
	$(AR) rs $@ $^

clean:
	rm -f $(LIBRARY)
	rm -f *.o