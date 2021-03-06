################################################################################
#
# xterm
#
################################################################################

XTERM_VERSION = 306
XTERM_SOURCE = xterm-$(XTERM_VERSION).tgz
XTERM_SITE = ftp://invisible-island.net/xterm
XTERM_DEPENDENCIES = ncurses xlib_libXaw
XTERM_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install

$(eval $(autotools-package))
