################################################################################
#
# libretro-flycast
#
################################################################################
LIBRETRO_FLYCAST_VERSION = v2.3.2
LIBRETRO_FLYCAST_SITE = https://github.com/flyinghead/flycast.git
LIBRETRO_FLYCAST_SITE_METHOD=git
LIBRETRO_FLYCAST_GIT_SUBMODULES=YES
LIBRETRO_FLYCAST_LICENSE = GPLv2

LIBRETRO_FLYCAST_PLATFORM = $(LIBRETRO_PLATFORM)

LIBRETRO_FLYCAST_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release
LIBRETRO_FLYCAST_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
LIBRETRO_FLYCAST_CONF_OPTS += -DLIBRETRO=ON
LIBRETRO_FLYCAST_CONF_OPTS += -DUSE_OPENMP=ON
LIBRETRO_FLYCAST_CONF_OPTS += -DBUILD_EXTERNAL=OFF

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_X86_64_ANY),y)
    LIBRETRO_FLYCAST_CONF_OPTS += -DUSE_OPENGL=ON
else ifeq ($(BR2_PACKAGE_BATOCERA_GLES3),y)
    LIBRETRO_FLYCAST_CONF_OPTS += -DUSE_GLES=ON -DUSE_GLES2=OFF
else ifeq ($(BR2_PACKAGE_BATOCERA_GLES2),y)
    LIBRETRO_FLYCAST_CONF_OPTS += -DUSE_GLES2=ON -DUSE_GLES=OFF
endif

ifeq ($(BR2_PACKAGE_REGLINUX_VULKAN),y)
    LIBRETRO_FLYCAST_CONF_OPTS += -DUSE_VULKAN=ON
else
    LIBRETRO_FLYCAST_CONF_OPTS += -DUSE_VULKAN=OFF
endif

ifeq ($(BR2_PACKAGE_HAS_LIBMALI),y)
    LIBRETRO_FLYCAST_DEPENDENCIES += libmali
    LIBRETRO_FLYCAST_CONF_OPTS += -DUSE_MALI=ON
endif

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_RK3399),y)
    LIBRETRO_FLYCAST_CONF_OPTS += -DRK3399=ON
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2711),y)
    LIBRETRO_FLYCAST_CONF_OPTS += -DRPI4=ON
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2712),y)
    LIBRETRO_FLYCAST_CONF_OPTS += -DRPI5=ON
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_XU4),y)
    LIBRETRO_FLYCAST_CONF_OPTS += -DODROIDXU4=ON
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_S922X),y)
    LIBRETRO_FLYCAST_CONF_OPTS += -DS922X=ON
endif

define LIBRETRO_FLYCAST_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/flycast_libretro.so \
		$(TARGET_DIR)/usr/lib/libretro/flycast_libretro.so
endef

$(eval $(cmake-package))
