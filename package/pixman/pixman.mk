################################################################################
#
# pixman
#
################################################################################
PIXMAN_VERSION = 0.10.0
PIXMAN_SOURCE = pixman-$(PIXMAN_VERSION).tar.gz
PIXMAN_SITE = http://cairographics.org/releases/
PIXMAN_AUTORECONF = NO
PIXMAN_INSTALL_STAGING = YES
PIXMAN_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) install
PIXMAN_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install-strip

$(eval $(call AUTOTARGETS,package,pixman))
