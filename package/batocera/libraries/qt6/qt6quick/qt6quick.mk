################################################################################
#
# qt6quick
#
################################################################################

QT6QUICK_VERSION = $(QT6_VERSION)
QT6QUICK_SITE = $(QT6_SITE)
QT6QUICK_SOURCE = qtquick3d-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6QUICK_VERSION).tar.xz
QT6QUICK_INSTALL_STAGING = YES
QT6QUICK_SUPPORTS_IN_SOURCE_BUILD = NO

QT6QUICK_CMAKE_BACKEND = ninja

QT6QUICK_LICENSE = \
	GPL-2.0+ or LGPL-3.0, \
	GPL-3.0 with exception (tools), \
	GFDL-1.3 (docs), \
	BSD-3-Clause

QT6QUICK_LICENSE_FILES = \
	LICENSES/BSD-3-Clause.txt \
	LICENSES/GFDL-1.3-no-invariants-only.txt \
	LICENSES/GPL-2.0-only.txt \
	LICENSES/GPL-3.0-only.txt \
	LICENSES/LGPL-3.0-only.txt \
	LICENSES/Qt-GPL-exception-1.0.txt

QT6QUICK_CONF_OPTS = \
	-DQT_HOST_PATH=$(HOST_DIR) \
	-DBUILD_WITH_PCH=OFF \
	-DQT_BUILD_EXAMPLES=OFF \
	-DQT_BUILD_TESTS=OFF

QT6QUICK_DEPENDENCIES = \
	host-pkgconf \
	qt6base

$(eval $(cmake-package))
$(eval $(host-cmake-package))
