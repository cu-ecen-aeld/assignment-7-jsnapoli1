##############################################################
#
# LDD
#
##############################################################

LDD_VERSION = 5c3cae6ddc96b8645dfa6f6bc4ddbba08aae8789
LDD_SITE = https://github.com/cu-ecen-aeld/ldd3.git
LDD_SITE_METHOD = git
LDD_GIT_SUBMODULES = YES

LDD_MODULE_SUBDIRS = misc-modules
LDD_MODULE_SUBDIRS += scull

$(eval $(kernel-module))
$(eval $(generic-package))
