# New ports collection makefile for: kde settings in live mode
# Date created:        4 jan 2016
# Whom:                angelescuo@yahoo.com
#
# $FreeBSD$
#

PORTNAME= 	kde-live-settings-desktopbsd
PORTVERSION=	1.0
CATEGORIES=	x11

MAINTAINER=	angelescuo@yahoo.com
COMMENT=	DesktopBSD kde settings in live mode
LICENSE =	BSD

USE_GITHUB=	yes
GH_ACCOUNT=	DesktopBSD

NO_BUILD=	yes

do-install:
	@${MKDIR} -p ${STAGEDIR}/${PREFIX}/share/desktopbsd/kde-live-settings-desktopbsd
	@${CP} -R   ${WRKSRC}/* ${STAGEDIR}/${PREFIX}/share/desktopbsd/kde-live-settings-desktopbsd
.include <bsd.port.mk>
