# New ports collection makefile for: mate settings in installed mode
# Date created:        17 may 2015
# Whom:                angelescuo@yahoo.com
#
# $FreeBSD$
#

PORTNAME= 	gnome-installed-settings-desktopbsd
PORTVERSION=	1.0
CATEGORIES=	x11

MAINTAINER=	angelescuo@yahoo.com
COMMENT=	DesktopBSD gnome settings in installed mode
LICENSE =	BSD

USE_GITHUB=	yes
GH_ACCOUNT=	DesktopBSD

RUN_DEPENDS=	glib-compile-schemas:${PORTSDIR}/devel/glib-2.0 \
		 dpkg:${PORTSDIR}/archivers/dpkg

NO_BUILD=	yes

do-install:
	@${MKDIR} -p ${STAGEDIR}/${PREFIX}/share/desktopbsd/gnome-installed-settings-desktopbsd
	@${CP} -R   ${WRKSRC}/desktopbsd/* ${STAGEDIR}/${PREFIX}/share/desktopbsd/gnome-installed-settings-desktopbsd
	@${MKDIR} -p ${STAGEDIR}/${PREFIX}/share/gnome-background-properties
	@${CP} ${WRKSRC}/gnome-background-properties/desktopbsd.xml ${STAGEDIR}/${PREFIX}/share/gnome-background-properties
	@${MKDIR} -p ${STAGEDIR}/${PREFIX}/share/glib-2.0/schemas
	@${CP} -R   ${WRKSRC}/schemas/* ${STAGEDIR}/${PREFIX}/share/glib-2.0/schemas
.include <bsd.port.mk>
