# In this directory, type one of the following:
#   make
#   make all

SUBDIRS = application library

all: $(SUBDIRS)

application: library
library: gtest/libgtest.a

$(SUBDIRS):
	$(MAKE) -C $@ 

clean:
	make -C application clean && make -C library clean && rm -rf gtest

gtest/libgtest.a:
	mkdir gtest
	cd gtest && cmake /usr/src/gtest
	$(MAKE) -C gtest

.PHONY: all $(SUBDIRS) clean
