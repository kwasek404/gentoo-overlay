# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3

DESCRIPTION="Template for container apps"
HOMEPAGE="https://github.com/kwasek404/docker-app-desktop"
EGIT_REPO_URI="https://github.com/kwasek404/docker-app-desktop.git"
EGIT_BRANCH=spotify
#EGIT_COMMIT=TAG

LICENSE="LGPL-2+ GPL-3+"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="app-emulation/docker"
DEPEND="${RDEPEND}"

#src_configure() {}

#src_compile() {
#	docker build -t ${PN}:${PV} template-archlinux || die "docker build failed"
#}

src_install() {
	docker build -t ${PN}:${PV} template-archlinux || die "docker build failed"
}
