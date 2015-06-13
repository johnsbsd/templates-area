# New ports collection makefile for: xfce settings in live mode
# Date created:        11 may 2015
# Whom:                angelescuo@yahoo.com
#
# $FreeBSD$
#

PORTNAME= 	xfce-live-settings-@CODENAME_SAFE@
PORTVERSION=	@PORT_VERSION@
CATEGORIES=	x11

MAINTAINER=	angelescuo@yahoo.com
COMMENT=	@DISTRO@ xfce settings in live mode
LICENSE =	BSD

USE_GITHUB=	yes
GH_ACCOUNT=	@ORGANIZATION@

NO_BUILD=	yes

do-install:
	@${MKDIR} -p ${STAGEDIR}/${PREFIX}/share/@DISTRO_SAFE@/xfce-live-settings-@CODENAME_SAFE@
	@${CP} -R   ${WRKSRC}/* ${STAGEDIR}/${PREFIX}/share/@DISTRO_SAFE@/xfce-live-settings-@CODENAME_SAFE@
.include <bsd.port.mk>
