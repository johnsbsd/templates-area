# New ports collection makefile for: mate settings in installed mode
# Date created:        17 may 2015
# Whom:                angelescuo@yahoo.com
#
# $FreeBSD$
#

PORTNAME= 	gnome-installed-settings-Karine
PORTVERSION=	1.0
CATEGORIES=	x11

MAINTAINER=	angelescuo@yahoo.com
COMMENT=	GhostBSD gnome settings in installed mode
LICENSE =	BSD

USE_GITHUB=	yes
GH_ACCOUNT=	GhostBSD

RUN_DEPENDS=	glib-compile-schemas:${PORTSDIR}/devel/glib-2.0 \
		 dpkg:${PORTSDIR}/archivers/dpkg

NO_BUILD=	yes

do-install:
	@${MKDIR} -p ${STAGEDIR}/${PREFIX}/share/ghostbsd/gnome-installed-settings-Karine
	@${CP} -R   ${WRKSRC}/ghostbsd/* ${STAGEDIR}/${PREFIX}/share/ghostbsd/gnome-installed-settings-Karine
	@${MKDIR} -p ${STAGEDIR}/${PREFIX}/share/gnome-background-properties
	@${CP} ${WRKSRC}/gnome-background-properties/ghostbsd.xml ${STAGEDIR}/${PREFIX}/share/gnome-background-properties
	@${MKDIR} -p ${STAGEDIR}/${PREFIX}/share/glib-2.0/schemas
	@${CP} -R   ${WRKSRC}/schemas/* ${STAGEDIR}/${PREFIX}/share/glib-2.0/schemas
.include <bsd.port.mk>
