TARGET=test
MYCONFIG=`mysql_config --cflags --libs`
SRCS = $(wildcard *.c)
OBJS = $(SRCS:.c=.o)

all: $(TARGET)

%.o: %.c
	$(CC) -c $< $(MYCONFIG)
$(TARGET): $(OBJS)
	$(CC) -o $@ $(OBJS) $(MYCONFIG)
clean:
	rm -rf *.o $(TARGET) a.out
