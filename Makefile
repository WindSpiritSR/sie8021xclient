include $(TOPDIR)/rules.mk

PKG_NAME:=sie8021xclient
PKG_RELEASE:=testing
PKG_VERSION:=2.0
PKG_SOURCE:=https://github.com/WindSpiritSR/sie8021xclient/archive/refs/heads/master.zip
PKG_FIXUP:=autoreconf

include $(INCLUDE_DIR)/package.mk

define Package/sie8021xclient
  SECTION:=net
  CATEGORY:=Network
  TITLE:=SIE 802.1X client program
  URL:=https://github.com/WindSpiritSR/sie8021xclient
  DEPENDS:=+libpcap
  PKG_BUILD_DEPENDS:=+libopenssl
endef

define Package/sie8021xclient/Default/description
 802.1X client from Shenyang Institude of Engineering,
 compatable with H3C iNode 802.1X client.
 Support H3C/iNode's private authentication protocol V2.40-V3.60
endef

CONFIGURE_ARGS += \
	--program-prefix="sie-" \
	$(NULL)

define Build/Prepare
$(call Build/Prepare/Default)
endef

define Build/Configure
$(call Build/Configure/Default)
endef

define Package/sie8021xclient/install
	$(MAKE) -C $(PKG_BUILD_DIR) install-exec DESTDIR=$(1)
endef

define Package/sie8021xclient/conffiles
/etc/config/sie8021xclient.conf
endef

define Package/sie8021xclient/description
  $(call Package/sie8021xclient/Default/description)
  This package contains only the main program sie-client.
endef

$(eval $(call BuildPackage,sie8021xclient))
