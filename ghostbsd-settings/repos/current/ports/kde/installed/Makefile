# New ports collection makefile for: kde settings in installed mode
# Date created:        4 Jan 2016
# Whom:                angelescuo@yahoo.com
#
# $FreeBSD$
#

PORTNAME= 	kde-installed-settings-desktopbsd
PORTVERSION=	1.0
CATEGORIES=	x11

MAINTAINER=	angelescuo@yahoo.com
COMMENT=	DesktopBSD KDE settings in installed mode
LICENSE =	BSD

USE_GITHUB=	yes
GH_ACCOUNT=	DesktopBSD

RUN_DEPENDS=	dpkg:${PORTSDIR}/archivers/dpkg

NO_BUILD=	yes

do-install:
	@${MKDIR} -p ${STAGEDIR}/${PREFIX}/share/desktopbsd/kde-installed-settings-desktopbsd
	@${CP} -R   ${WRKSRC}/desktopbsd/* ${STAGEDIR}/${PREFIX}/share/desktopbsd/kde-installed-settings-desktopbsd
.include <bsd.port.mk>
