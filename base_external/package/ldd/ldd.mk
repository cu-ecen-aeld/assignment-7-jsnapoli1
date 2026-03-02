##############################################################
#
# LDD
#
##############################################################

LDD_VERSION = f0dbe59ac732b5d241ec428e24665eeaeaa12a20
LDD_SITE = https://github.com/cu-ecen-aeld/assignment-7-jsnapoli1.git
LDD_SITE_METHOD = git
LDD_GIT_SUBMODULES = YES

LDD_MODULE_SUBDIRS = misc-modules
LDD_MODULE_SUBDIRS += scull

$(eval $(kernel-module))
$(eval $(generic-package))
