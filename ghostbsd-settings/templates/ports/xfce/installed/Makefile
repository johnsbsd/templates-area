# New ports collection makefile for: xfce settings in installed mode
# Date created:        17 may 2015
# Whom:                angelescuo@yahoo.com
#
# $FreeBSD$
#

PORTNAME= 	xfce-installed-settings-@CODENAME_SAFE@
PORTVERSION=	@PORT_VERSION@
CATEGORIES=	x11

MAINTAINER=	angelescuo@yahoo.com
COMMENT=	@DISTRO@ xfce settings in installed mode
LICENSE =	BSD

USE_GITHUB=	yes
GH_ACCOUNT=	@ORGANIZATION@

NO_BUILD=	yes

do-install:
	@${MKDIR} -p ${STAGEDIR}/${PREFIX}/share/@DISTRO_SAFE@/xfce-installed-settings-@CODENAME_SAFE@/etc/skel
	@${CP} -R   ${WRKSRC}/etc/skel/* ${STAGEDIR}/${PREFIX}/share/@DISTRO_SAFE@/xfce-installed-settings-@CODENAME_SAFE@/etc/skel
	@${MKDIR} -p ${STAGEDIR}/${PREFIX}/share/@DISTRO_SAFE@/xfce-installed-settings-@CODENAME_SAFE@/etc/default/grub.d
	@${CP} -R   ${WRKSRC}/etc/default/* ${STAGEDIR}/${PREFIX}/share/@DISTRO_SAFE@/xfce-installed-settings-@CODENAME_SAFE@/etc/default
	@${MKDIR} -p ${STAGEDIR}/${PREFIX}/etc/xdg
	@${CP} -R   ${WRKSRC}/etc/xdg/* ${STAGEDIR}/${PREFIX}/etc/xdg
.include <bsd.port.mk>
