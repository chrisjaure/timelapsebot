PREFIX = /usr/local
SYSTEMD_UNIT_DIR = /etc/systemd/system

install-bin:
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	install -m 0755 tlb $(DESTDIR)$(PREFIX)/bin

install-service:
	mkdir -p $(DESTDIR)$(SYSTEMD_UNIT_DIR)
	install -m 0644 timelapsebot.service \
		timelapsebot.timer \
		$(DESTDIR)$(SYSTEMD_UNIT_DIR)

install: install-bin install-service

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/tlb
	rm -f $(DESTDIR)$(SYSTEMD_UNIT_DIR)/timelapsebot.*
