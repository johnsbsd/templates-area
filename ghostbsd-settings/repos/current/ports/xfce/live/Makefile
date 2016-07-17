# New ports collection makefile for: xfce settings in live mode
# Date created:        11 may 2015
# Whom:                angelescuo@yahoo.com
#
# $FreeBSD$
#

PORTNAME= 	xfce-live-settings-desktopbsd
PORTVERSION=	1.0
CATEGORIES=	x11

MAINTAINER=	angelescuo@yahoo.com
COMMENT=	DesktopBSD xfce settings in live mode
LICENSE =	BSD

USE_GITHUB=	yes
GH_ACCOUNT=	DesktopBSD

NO_BUILD=	yes

do-install:
	@${MKDIR} -p ${STAGEDIR}/${PREFIX}/share/desktopbsd/xfce-live-settings-desktopbsd
	@${CP} -R   ${WRKSRC}/* ${STAGEDIR}/${PREFIX}/share/desktopbsd/xfce-live-settings-desktopbsd
.include <bsd.port.mk>
