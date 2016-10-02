APPNAME = digabi-koe-ohje

all:

install:
	install -D -m 0755 digabi-koe-ohje.sh $(DESTDIR)/usr/bin/$(APPNAME)
	install -d -m 0755 $(DESTDIR)/usr/share/$(APPNAME)
	install -D -m 0644 digabi-koe-ohje.desktop $(DESTDIR)/usr/share/applications/digabi-koe-ohje.desktop

	# Common files (images etc)
	cp -r common $(DESTDIR)/usr/share/${APPNAME}/

	# Finnish documentation
	cp -r fi $(DESTDIR)/usr/share/$(APPNAME)/

	# Swedish documentation
	cp -r sv $(DESTDIR)/usr/share/$(APPNAME)/

	# Common content to Finnish/Swedish documentation
	cp -r content/* $(DESTDIR)/usr/share/$(APPNAME)/fi/
	cp -r content/* $(DESTDIR)/usr/share/$(APPNAME)/sv/

	# Set perms
	find $(DESTDIR)/usr/share/$(APPNAME) -type f -exec chmod 644 {} \;
	find $(DESTDIR)/usr/share/$(APPNAME) -type d -exec chmod 755 {} \;