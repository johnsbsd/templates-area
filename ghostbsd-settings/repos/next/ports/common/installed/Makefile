# New ports collection makefile for: GhostBSD common settings in installed mode
# Date created:        17 may 2015
# Whom:                angelescuo@yahoo.com
#
# $FreeBSD$
#

PORTNAME= 	ghostbsd-installed-common-settings-ASX64
PORTVERSION=	1.0
CATEGORIES=	x11

MAINTAINER=	angelescuo@yahoo.com
COMMENT=	GhostBSD common settings in installed mode
LICENSE =	BSD

USE_GITHUB=	yes
GH_ACCOUNT=	@ORANIZATION@
GH_PROJECT=	${PORTNAME}
GH_TAGNAME=	${PORTVERSION}
GH_COMMIT=	954ce53


NO_BUILD=	yes
RUN_DEPENDS= dpkg:${PORTSDIR}/archivers/dpkg

do-install:
	@${MKDIR} -p ${STAGEDIR}/${PREFIX}/share/ghostbsd
	@${CP} -R   ${WRKSRC}/ghostbsd/* ${STAGEDIR}/${PREFIX}/share/ghostbsd
	@${RM} -f ${STAGEDIR}/${PREFIX}/share/ghostbsd/common-installed-settings-ASX64/base/backup/boot/.gitignore
	@${RM} -f ${STAGEDIR}/${PREFIX}/share/ghostbsd/common-installed-settings-ASX64/base/backup/etc/.gitignore
	@${RM} -f ${STAGEDIR}/${PREFIX}/share/ghostbsd/common-installed-settings-ASX64/packages/backup/applications/.gitignore
	@${RM} -f ${STAGEDIR}/${PREFIX}/share/ghostbsd/common-installed-settings-ASX64/packages/backup/etc/X11/.gitignore
	@${MKDIR} -p ${STAGEDIR}/${PREFIX}/share/sounds
	@${CP} -R   ${WRKSRC}/usr/local/* ${STAGEDIR}/${PREFIX}
.include <bsd.port.mk>
