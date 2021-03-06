################################################################################
#
# dbus-c++
#
################################################################################

DBUS_CPP_VERSION = 0.9.0
DBUS_CPP_SITE = http://downloads.sourceforge.net/project/dbus-cplusplus/dbus-c++/$(DBUS_CPP_VERSION)
DBUS_CPP_SOURCE = libdbus-c++-$(DBUS_CPP_VERSION).tar.gz
DBUS_CPP_INSTALL_STAGING = YES
# expat is required for the tools irrespective of dbus xml backend
DBUS_CPP_DEPENDENCIES = host-dbus-cpp host-pkgconf dbus expat
HOST_DBUS_CPP_DEPENDENCIES = host-pkgconf host-dbus host-expat
DBUS_CPP_CONF_OPT = --disable-examples --disable-tests --disable-doxygen-docs \
	--with-build-libdbus-cxx=$(HOST_DBUS_CPP_BUILDDIR)
HOST_DBUS_CPP_CONF_OPT = --disable-examples --disable-tests \
	--disable-doxygen-docs --disable-ecore --disable-glib
DBUS_CPP_AUTORECONF = YES
DBUS_CPP_LICENSE = LGPLv2.1+
DBUS_CPP_LICENSE_FILES = COPYING

ifeq ($(BR2_PACKAGE_LIBECORE),y)
	DBUS_CPP_CONF_OPT += --enable-ecore
	DBUS_CPP_DEPENDENCIES += libecore
else
	DBUS_CPP_CONF_OPT += --disable-ecore
endif

ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
	DBUS_CPP_CONF_OPT += --enable-glib
	DBUS_CPP_DEPENDENCIES += libglib2
else
	DBUS_CPP_CONF_OPT += --disable-glib
endif

$(eval $(autotools-package))
$(eval $(host-autotools-package))
