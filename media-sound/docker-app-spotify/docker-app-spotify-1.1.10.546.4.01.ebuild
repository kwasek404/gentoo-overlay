# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3 desktop

DESCRIPTION="Template for container apps"
HOMEPAGE="https://github.com/kwasek404/docker-app-desktop"
EGIT_REPO_URI="https://github.com/kwasek404/docker-app-desktop.git"
EGIT_BRANCH=spotify
#EGIT_COMMIT=TAG

LICENSE="LGPL-2+ GPL-3+"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="app-emulation/docker-app-template-archlinux x11-apps/xhost"
DEPEND="${RDEPEND} sys-apps/sed"

src_compile() {
	sed "s/\$1/${PN}\:${PV}/g" -i execute.sh
	mv execute.sh ${PN}
}

src_install() {
	docker build -t ${PN}:${PV} spotify || die "docker build failed"
	dobin ${PN}
	docker run --rm --entrypoint cat ${PN}:${PV} /usr/share/icons/hicolor/512x512/apps/spotify.png > ${PN}.png
	doicon ${PN}.png
	make_desktop_entry "/usr/bin/${PN}" "${PN}.png" 'Audio;Music;Player;AudioVideo;'
}

pkg_postrm() {
	docker image rm "${PN}:${PV}"
}
