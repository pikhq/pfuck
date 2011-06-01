.PHONY: all test clean

all: test

test: LostKng.0.c LostKng.-1.c LostKng.b LostKng.test.0 LostKng.test.-1
	-if [ -z `diff LostKng.0.c LostKng.test.0` ];then echo "pfuck.0 works";else echo "pfuck.0 failure";false;fi
	-if [ -z `diff LostKng.-1.c LostKng.test.-1` ];then echo "pfuck.-1 works";else echo "pfuck.-1 failure";false;fi

LostKng.test.0:
	-../pfuck.0 < LostKng.b > LostKng.test.0

LostKng.test.-1:
	-../pfuck.-1 < LostKng.b > LostKng.test.-1

clean:
	rm -f LostKng.test.-1 LostKng.test.0
