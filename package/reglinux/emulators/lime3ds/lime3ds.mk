################################################################################
#
# Lime3DS
#
################################################################################

LIME3DS_VERSION = 2119.1
LIME3DS_SITE = https://github.com/Lime3DS/lime3ds-archive.git
LIME3DS_SITE_METHOD = git
LIME3DS_GIT_SUBMODULES=YES
LIME3DS_LICENSE = GPLv2
LIME3DS_DEPENDENCIES += fmt boost ffmpeg sdl2 fdk-aac
LIME3DS_SUPPORTS_IN_SOURCE_BUILD = NO

LIME3DS_GIT_SUBMODULES = YES

LIME3DS_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release
LIME3DS_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
LIME3DS_CONF_OPTS += -DENABLE_SDL2=ON
LIME3DS_CONF_OPTS += -DENABLE_TESTS=OFF
LIME3DS_CONF_OPTS += -DENABLE_DEDICATED_ROOM=OFF
LIME3DS_CONF_OPTS += -DENABLE_WEB_SERVICE=OFF
LIME3DS_CONF_OPTS += -DENABLE_OPENAL=OFF
LIME3DS_CONF_OPTS += -DUSE_DISCORD_PRESENCE=OFF
LIME3DS_CONF_OPTS += -DLIME3DS_WARNINGS_AS_ERRORS=OFF
LIME3DS_CONF_OPTS += -DLIME3DS_ENABLE_COMPATIBILITY_REPORTING=ON
LIME3DS_CONF_OPTS += -DENABLE_COMPATIBILITY_LIST_DOWNLOAD=ON
LIME3DS_CONF_OPTS += -DUSE_SYSTEM_BOOST=ON
LIME3DS_CONF_OPTS += -DUSE_SYSTEM_SDL2=ON    # important to avoid HIDAPI
LIME3DS_CONF_OPTS += -DCITRA_ENABLE_BUNDLE_TARGET=ON
LIME3DS_CONF_OPTS += -DENABLE_LTO=OFF

ifeq ($(BR2_PACKAGE_REGLINUX_HAS_QT6),y)
    LIME3DS_DEPENDENCIES += reglinux-qt6
    LIME3DS_CONF_OPTS += -DENABLE_QT=ON
    LIME3DS_CONF_OPTS += -DENABLE_QT_TRANSLATION=ON
    LIME3DS_CONF_OPTS += -DENABLE_QT_UPDATER=OFF
    LIME3DS_BIN = lime3ds
else
    LIME3DS_CONF_OPTS += -DENABLE_QT=OFF
    LIME3DS_CONF_OPTS += -DENABLE_SDL2_FRONTEND=ON
    LIME3DS_BIN = lime3ds-cli
endif

LIME3DS_CONF_ENV += LDFLAGS=-lpthread

define LIME3DS_INSTALL_TARGET_CMDS
    mkdir -p $(TARGET_DIR)/usr/bin
    mkdir -p $(TARGET_DIR)/usr/lib
	$(INSTALL) -D $(@D)/buildroot-build/bin/Release/$(LIME3DS_BIN) \
		$(TARGET_DIR)/usr/bin/
endef

define LIME3DS_EVMAP
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp -prn $(BR2_EXTERNAL_BATOCERA_PATH)/package/reglinux/emulators/lime3ds/3ds.lime3ds.keys \
		$(TARGET_DIR)/usr/share/evmapy
endef

LIME3DS_POST_INSTALL_TARGET_HOOKS = LIME3DS_EVMAP

$(eval $(cmake-package))
