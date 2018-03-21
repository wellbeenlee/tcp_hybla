obj-m := tcp_hybla-nanqinlang.o

all:
	make -C /lib/modules/`uname -r`/build M=`pwd` modules CC=/usr/bin/gcc-4.9

clean:
	make -C /lib/modules/`uname -r`/build M=`pwd` clean

install:
	install tcp_hybla.ko /lib/modules/`uname -r`/kernel/net/ipv4
	insmod /lib/modules/`uname -r`/kernel/net/ipv4/tcp_hybla.ko
	depmod -a

uninstall:
	rm /lib/modules/`uname -r`/kernel/net/ipv4/tcp_hybla.ko