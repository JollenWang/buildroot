################################################################################
#
# lksctp-tools
#
################################################################################

LKSCTP_TOOLS_VERSION = 1.0.16
LKSCTP_TOOLS_SITE = http://downloads.sourceforge.net/project/lksctp/lksctp-tools
LKSCTP_TOOLS_INSTALL_STAGING = YES
# configure not shipped
LKSCTP_TOOLS_AUTORECONF = YES
LKSCTP_TOOLS_LICENSE = LGPLv2.1 (library), GPLv2+ (programs)
LKSCTP_TOOLS_LICENSE_FILES = COPYING.lib COPYING

# Needed by autoreconf
define LKSCTP_TOOLS_MAKE_M4
	mkdir -p $(@D)/m4
endef
LKSCTP_TOOLS_POST_PATCH_HOOKS += LKSCTP_TOOLS_MAKE_M4

# Cleanup installed target source code
define LKSCTP_TOOLS_CLEANUP_TARGET
	rm -rf $(TARGET_DIR)/usr/share/lksctp-tools
endef
LKSCTP_TOOLS_POST_INSTALL_TARGET_HOOKS += LKSCTP_TOOLS_CLEANUP_TARGET

$(eval $(autotools-package))