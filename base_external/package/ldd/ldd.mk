
##############################################################
#
# LDD
#
##############################################################

#TODO: Fill up the contents below in order to reference your assignment 3 git contents
LDD_VERSION = '898d80fabf5fec212854da56e45a2f8f1f0d3403'
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
LDD_SITE = 'git@github.com:cu-ecen-aeld/assignment-7-bharathvarmaCU18.git'
LDD_SITE_METHOD = git
LDD_GIT_SUBMODULES = YES

LDD_MODULE_SUBDIRS = misc-modules scull



LDD_MODULE_MAKE_OPTS = \
    ARCH=$(KERNEL_ARCH) \
    KERNELDIR=$(LINUX_DIR) \
    KVERSION=$(LINUX_VERSION_PROBED) \
    EXTRA_CFLAGS="-I$(@D)/include"

#define LDD_BUILD_CMDS
#	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/misc-modules
#        $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/scull
#endef

# TODO add your writer, finder and finder-test utilities/scripts to the installation steps below
define LDD_INSTALL_TARGET_CMDS
	#$(INSTALL) -m 755 $(@D)/scull/scull.ko $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 755 $(@D)/scull/scull_load $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 755 $(@D)/scull/scull_unload $(TARGET_DIR)/usr/bin
	
	#$(INSTALL) -m 755 $(@D)/misc-modules/hello.ko $(TARGET_DIR)/usr/bin
	#$(INSTALL) -m 755 $(@D)/misc-modules/faulty.ko $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 755 $(@D)/misc-modules/module_load $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 755 $(@D)/misc-modules/module_unload $(TARGET_DIR)/usr/bin
	
	
	$(INSTALL) -m 755 $(@D)/scull/scull.ko $(TARGET_DIR)/usr/bin/scull.ko
	$(INSTALL) -m 755 $(@D)/misc-modules/faulty.ko $(TARGET_DIR)/usr/bin/faulty.ko
	$(INSTALL) -m 755 $(@D)/misc-modules/hello.ko $(TARGET_DIR)/usr/bin/hello.ko
	
	
	$(INSTALL) -m 755 $(@D)/scull/scull.ko $(TARGET_DIR)/etc/init.d/scull.ko
        $(INSTALL) -m 755 $(@D)/misc-modules/faulty.ko $(TARGET_DIR)/etc/init.d/faulty.ko
        $(INSTALL) -m 755 $(@D)/misc-modules/hello.ko $(TARGET_DIR)/etc/init.d/hello.ko
endef

$(eval $(kernel-module))
$(eval $(generic-package))


