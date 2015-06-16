# New ports collection makefile for: cinnamon settings in installed mode
# Date created:        17 may 2015
# Whom:                angelescuo@yahoo.com
#
# $FreeBSD$
#

PORTNAME= 	cinnamon-installed-settings-@CODENAME_SAFE@
PORTVERSION=	@PORT_VERSION@
CATEGORIES=	x11

MAINTAINER=	angelescuo@yahoo.com
COMMENT=	@DISTRO@ cinnamon settings in installed mode
LICENSE =	BSD

USE_GITHUB=	yes
GH_ACCOUNT=	@ORGANIZATION@

RUN_DEPENDS=	glib-compile-schemas:${PORTSDIR}/devel/glib-2.0 \
		 dpkg:${PORTSDIR}/archivers/dpkg

NO_BUILD=	yes

do-install:
	@${MKDIR} -p ${STAGEDIR}/${PREFIX}/share/@DISTRO_SAFE@/cinnamon-installed-settings-@CODENAME_SAFE@
	@${CP} -R   ${WRKSRC}/@DISTRO_SAFE@/* ${STAGEDIR}/${PREFIX}/share/@DISTRO_SAFE@/cinnamon-installed-settings-@CODENAME_SAFE@
	@${MKDIR} -p ${STAGEDIR}/${PREFIX}/share/cinnamon-background-properties
	@${CP} ${WRKSRC}/cinnamon-background-properties/@DISTRO_SAFE@.xml ${STAGEDIR}/${PREFIX}/share/cinnamon-background-properties
	@${MKDIR} -p ${STAGEDIR}/${PREFIX}/share/glib-2.0/schemas
	@${CP} -R   ${WRKSRC}/schemas/* ${STAGEDIR}/${PREFIX}/share/glib-2.0/schemas
.include <bsd.port.mk>
