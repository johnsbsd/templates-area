# New ports collection makefile for: @DISTRO@ settings for grub2
# Date created:        11 may 2015
# Whom:                angelescuo@yahoo.com
#
# $FreeBSD$
#

PORTNAME= 	@DISTRO_SAFE@-grub2-settings
PORTVERSION=	@PORT_VERSION@
CATEGORIES=	x11

MAINTAINER=	angelescuo@yahoo.com
COMMENT=	@DISTRO@ grub2 settings
LICENSE =	BSD

USE_GITHUB=	yes
GH_ACCOUNT=	@ORGANIZATION@

RUN_DEPENDS=	glib-compile-schemas:${PORTSDIR}/devel/glib-2.0

NO_BUILD=	yes

do-install:
	@${MKDIR} -p ${STAGEDIR}/boot/grub/themes/@DISTRO_SAFE@
	@${CP} -R   ${WRKSRC}/grub2/* ${STAGEDIR}/
.include <bsd.port.mk>
