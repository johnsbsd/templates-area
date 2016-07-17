# New ports collection makefile for: kde settings in installed mode
# Date created:        4 Jan 2016
# Whom:                angelescuo@yahoo.com
#
# $FreeBSD$
#

PORTNAME= 	kde-installed-settings-@CODENAME_SAFE@
PORTVERSION=	@PORT_VERSION@
CATEGORIES=	x11

MAINTAINER=	angelescuo@yahoo.com
COMMENT=	@DISTRO@ KDE settings in installed mode
LICENSE =	BSD

USE_GITHUB=	yes
GH_ACCOUNT=	@ORGANIZATION@

RUN_DEPENDS=	dpkg:${PORTSDIR}/archivers/dpkg

NO_BUILD=	yes

do-install:
	@${MKDIR} -p ${STAGEDIR}/${PREFIX}/share/@DISTRO_SAFE@/kde-installed-settings-@CODENAME_SAFE@
	@${CP} -R   ${WRKSRC}/@DISTRO_SAFE@/* ${STAGEDIR}/${PREFIX}/share/@DISTRO_SAFE@/kde-installed-settings-@CODENAME_SAFE@
.include <bsd.port.mk>
