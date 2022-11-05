include config.mk

BINDIR=/bin
SYSCONFDIR=/etc

.PHONY: all clean install Xvnc-cli

all: Xvnc-cli

Xvnc-cli: Xvnc-cli.in
	@echo Building $@; \
	bindir=$$(echo ${PREFIX}${BINDIR} | sed 's/\//\\\//g'); \
	sysconfdir=$$(echo ${SYSCONFDIR} | sed 's/\//\\\//g'); \
	sed -e "s/@CMAKE_INSTALL_FULL_BINDIR@/$$bindir/g" \
			-e "s/@CMAKE_INSTALL_FULL_SYSCONFDIR@/$$sysconfdir/g" $< > $@ && \
	chmod 755 $@


install: Xvnc-cli
	@echo Installing $< to ${DESTDIR}${PREFIX}${BINDIR}; \
	test -d ${DESTDIR}${PREFIX}${BINDIR} || install -d ${DESTDIR}${PREFIX}${BINDIR}; \
	install $< ${DESTDIR}${PREFIX}${BINDIR}

clean:
	@echo Cleaning files;\
	rm -f Xvnc-cli
