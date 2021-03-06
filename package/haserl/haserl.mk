#############################################################
#
# haserl
#
#############################################################

HASERL_VERSION:=$(strip $(subst ",,$(BR2_PACKAGE_HASERL_VERSION)))
#"))
HASERL_SOURCE:=haserl-$(HASERL_VERSION).tar.gz
HASERL_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/haserl/
HASERL_AUTORECONF:=no
HASERL_INSTALL_STAGING:=NO
HASERL_INSTALL_TARGET:=YES
HASERL_INSTALL_TARGET_OPT:=DESTDIR=$(TARGET_DIR) STRIPPROG='$(STRIPCMD)' install-strip

# force haserl 0.8.0 to use install-sh so stripping works
HASERL_CONF_ENV = ac_cv_path_install=./install-sh

HASERL_DEPENDENCIES:=uclibc

$(eval $(call AUTOTARGETS,package,haserl))

# haserl 0.8.0 installs unneeded examples to /usr/share/haserl - remove them
$(HASERL_HOOK_POST_INSTALL): $(HASERL_TARGET_INSTALL_TARGET)
	rm -rf $(TARGET_DIR)/usr/share/haserl
	touch $@
