# New ports collection makefile for: GhostBSD common settings in installed mode
# Date created:        17 may 2015
# Whom:                angelescuo@yahoo.com
#
# $FreeBSD$
#

PORTNAME= 	ghostbsd-installed-common-settings
PORTVERSION=	1.0
CATEGORIES=	x11

MAINTAINER=	angelescuo@yahoo.com
COMMENT=	GhostBSD common settings in installed mode
LICENSE =	BSD

USE_GITHUB=	yes
GH_ACCOUNT=	GhostBSD

NO_BUILD=	yes
RUN_DEPENDS= dpkg:${PORTSDIR}/archivers/dpkg

do-install:
	@${MKDIR} -p ${STAGEDIR}/${PREFIX}/share/ghostbsd
	@${CP} -R   ${WRKSRC}/ghostbsd/* ${STAGEDIR}/${PREFIX}/share/ghostbsd
	@${RM} -f ${STAGEDIR}/${PREFIX}/share/ghostbsd/common-installed-settings/base/backup/boot/.gitignore
	@${RM} -f ${STAGEDIR}/${PREFIX}/share/ghostbsd/common-installed-settings/base/backup/etc/.gitignore
	@${RM} -f ${STAGEDIR}/${PREFIX}/share/ghostbsd/common-installed-settings/packages/backup/applications/.gitignore
	@${RM} -f ${STAGEDIR}/${PREFIX}/share/ghostbsd/common-installed-settings/packages/backup/etc/X11/.gitignore
	@${MKDIR} -p ${STAGEDIR}/${PREFIX}/share/sounds
	@${CP} -R   ${WRKSRC}/usr/local/* ${STAGEDIR}/${PREFIX}
.include <bsd.port.mk>
