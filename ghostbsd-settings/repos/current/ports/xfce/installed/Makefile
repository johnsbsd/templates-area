# New ports collection makefile for: xfce settings in installed mode
# Date created:        17 may 2015
# Whom:                angelescuo@yahoo.com
#
# $FreeBSD$
#

PORTNAME= 	xfce-installed-settings-desktopbsd
PORTVERSION=	1.0
CATEGORIES=	x11

MAINTAINER=	angelescuo@yahoo.com
COMMENT=	DesktopBSD xfce settings in installed mode
LICENSE =	BSD

USE_GITHUB=	yes
GH_ACCOUNT=	DesktopBSD

NO_BUILD=	yes

do-install:
	@${MKDIR} -p ${STAGEDIR}/${PREFIX}/share/desktopbsd/xfce-installed-settings-desktopbsd/etc/skel
	@${CP} -R   ${WRKSRC}/etc/skel/* ${STAGEDIR}/${PREFIX}/share/desktopbsd/xfce-installed-settings-desktopbsd/etc/skel
	@${MKDIR} -p ${STAGEDIR}/${PREFIX}/share/desktopbsd/xfce-installed-settings-desktopbsd/etc/default/grub.d
	@${CP} -R   ${WRKSRC}/etc/default/* ${STAGEDIR}/${PREFIX}/share/desktopbsd/xfce-installed-settings-desktopbsd/etc/default
	@${MKDIR} -p ${STAGEDIR}/${PREFIX}/etc/xdg
	@${CP} -R   ${WRKSRC}/etc/xdg/* ${STAGEDIR}/${PREFIX}/etc/xdg
.include <bsd.port.mk>
