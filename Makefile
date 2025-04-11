# Makefile for constructing RPMs.
# Try "make" (for SRPMS) or "make rpm"

all:

install:
	mkdir -p $(DESTDIR)/usr/share/haproxy-ansible/

	cp -a README.MD $(DESTDIR)/usr/share/haproxy-ansible/
	cp -a *.yml $(DESTDIR)/usr/share/haproxy-ansible/
	cp -a *.sample $(DESTDIR)/usr/share/haproxy-ansible/
	cp -a group_vars $(DESTDIR)/usr/share/haproxy-ansible/
	cp -a host_vars $(DESTDIR)/usr/share/haproxy-ansible/
	cp -a roles $(DESTDIR)/usr/share/haproxy-ansible/


uninstall:
	rm -rf $(DESTDIR)/usr/share/haproxy-ansible

