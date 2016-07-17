# New ports collection makefile for: DesktopBSD common settings in installed mode
# Date created:        17 may 2015
# Whom:                angelescuo@yahoo.com
#
# $FreeBSD$
#

PORTNAME= 	desktopbsd-installed-common-settings-desktopbsd
PORTVERSION=	1.0
CATEGORIES=	x11

MAINTAINER=	angelescuo@yahoo.com
COMMENT=	DesktopBSD common settings in installed mode
LICENSE =	BSD

USE_GITHUB=	yes
GH_ACCOUNT=	DesktopBSD

NO_BUILD=	yes
RUN_DEPENDS= dpkg:${PORTSDIR}/archivers/dpkg

do-install:
	@${MKDIR} -p ${STAGEDIR}/${PREFIX}/share/desktopbsd
	@${CP} -R   ${WRKSRC}/desktopbsd/* ${STAGEDIR}/${PREFIX}/share/desktopbsd
	@${RM} -f ${STAGEDIR}/${PREFIX}/share/desktopbsd/common-installed-settings-desktopbsd/base/backup/boot/.gitignore
	@${RM} -f ${STAGEDIR}/${PREFIX}/share/desktopbsd/common-installed-settings-desktopbsd/base/backup/etc/.gitignore
	@${RM} -f ${STAGEDIR}/${PREFIX}/share/desktopbsd/common-installed-settings-desktopbsd/packages/backup/applications/.gitignore
	@${RM} -f ${STAGEDIR}/${PREFIX}/share/desktopbsd/common-installed-settings-desktopbsd/packages/backup/etc/X11/.gitignore
	@${MKDIR} -p ${STAGEDIR}/${PREFIX}/share/sounds
	@${CP} -R   ${WRKSRC}/usr/local/* ${STAGEDIR}/${PREFIX}
.include <bsd.port.mk>
