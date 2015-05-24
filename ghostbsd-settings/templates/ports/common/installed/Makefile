# New ports collection makefile for: @DISTRO@ common settings in installed mode
# Date created:        17 may 2015
# Whom:                angelescuo@yahoo.com
#
# $FreeBSD$
#

PORTNAME= 	@DISTRO_SAFE@-installed-common-settings-@CODENAME_SAFE@
PORTVERSION=	@PORT_VERSION@
CATEGORIES=	x11

MAINTAINER=	angelescuo@yahoo.com
COMMENT=	@DISTRO@ common settings in installed mode
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
	@${RM} -f ${STAGEDIR}/${PREFIX}/share/ghostbsd/common-installed-settings-@CODENAME_SAFE@/base/backup/boot/.gitignore
	@${RM} -f ${STAGEDIR}/${PREFIX}/share/ghostbsd/common-installed-settings-@CODENAME_SAFE@/base/backup/etc/.gitignore
	@${RM} -f ${STAGEDIR}/${PREFIX}/share/ghostbsd/common-installed-settings-@CODENAME_SAFE@/packages/backup/applications/.gitignore
	@${RM} -f ${STAGEDIR}/${PREFIX}/share/ghostbsd/common-installed-settings-@CODENAME_SAFE@/packages/backup/etc/X11/.gitignore
	@${MKDIR} -p ${STAGEDIR}/${PREFIX}/share/sounds
	@${CP} -R   ${WRKSRC}/usr/local/* ${STAGEDIR}/${PREFIX}
.include <bsd.port.mk>
