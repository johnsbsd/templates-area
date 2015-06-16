# New ports collection makefile for: @DISTRO@ common settings in live mode
# Date created:        17 may 2015
# Whom:                angelescuo@yahoo.com
#
# $FreeBSD$
#

PORTNAME= 	@DISTRO_SAFE@-live-common-settings-@CODENAME_SAFE@
PORTVERSION=	@PORT_VERSION@
CATEGORIES=	x11

MAINTAINER=	angelescuo@yahoo.com
COMMENT=	@DISTRO@ common settings in live mode
LICENSE =	BSD

USE_GITHUB=	yes
GH_ACCOUNT=	@ORGANIZATION@

NO_BUILD=	yes
RUN_DEPENDS= dpkg:${PORTSDIR}/archivers/dpkg \
		sudo:${PORTSDIR}/security/sudo

do-install:
	@${MKDIR} -p ${STAGEDIR}/${PREFIX}/share/@DISTRO_SAFE@
	@${CP} -R   ${WRKSRC}/@DISTRO_SAFE@/* ${STAGEDIR}/${PREFIX}/share/@DISTRO_SAFE@
.include <bsd.port.mk>
