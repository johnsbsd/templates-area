# New ports collection makefile for: GhostBSD common settings in live mode
# Date created:        17 may 2015
# Whom:                angelescuo@yahoo.com
#
# $FreeBSD$
#

PORTNAME= 	ghostbsd-live-common-settings-ASX64
PORTVERSION=	1.0
CATEGORIES=	x11

MAINTAINER=	angelescuo@yahoo.com
COMMENT=	GhostBSD common settings in live mode
LICENSE =	BSD

USE_GITHUB=	yes
GH_ACCOUNT=	GhostBSD
GH_PROJECT=	${PORTNAME}
GH_TAGNAME=	${PORTVERSION}
GH_COMMIT=	d8c06c6


NO_BUILD=	yes
RUN_DEPENDS= dpkg:${PORTSDIR}/archivers/dpkg \
		sudo:${PORTSDIR}/security/sudo

do-install:
	@${MKDIR} -p ${STAGEDIR}/${PREFIX}/share/ghostbsd
	@${CP} -R   ${WRKSRC}/ghostbsd/* ${STAGEDIR}/${PREFIX}/share/ghostbsd
.include <bsd.port.mk>
