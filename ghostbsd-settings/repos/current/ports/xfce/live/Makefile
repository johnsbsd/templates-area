# New ports collection makefile for: xfce settings in live mode
# Date created:        11 may 2015
# Whom:                angelescuo@yahoo.com
#
# $FreeBSD$
#

PORTNAME= 	xfce-live-settings-Karine
PORTVERSION=	1.0
CATEGORIES=	x11

MAINTAINER=	angelescuo@yahoo.com
COMMENT=	GhostBSD xfce settings in live mode
LICENSE =	BSD

USE_GITHUB=	yes
GH_ACCOUNT=	GhostBSD
GH_PROJECT=	${PORTNAME}
GH_TAGNAME=	${PORTVERSION}
GH_COMMIT=	2b3ba06

NO_BUILD=	yes

do-install:
	@${MKDIR} -p ${STAGEDIR}/${PREFIX}/share/ghostbsd/xfce-live-settings-Karine
	@${CP} -R   ${WRKSRC}/* ${STAGEDIR}/${PREFIX}/share/ghostbsd/xfce-live-settings-Karine
.include <bsd.port.mk>
