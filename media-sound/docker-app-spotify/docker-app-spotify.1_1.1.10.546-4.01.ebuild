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
IUSE="filesystem"

RDEPEND="app-emulation/docker-app-template-archlinux x11-apps/xhost"
DEPEND="${RDEPEND} sys-apps/sed"

src_compile() {
  sed 's/\$1/spotify/g' -i execute.sh
}

src_install() {
	docker build -t ${PN}:${PV} spotify || die "docker build failed"
  cp -f execute.sh /usr/bin/${PN}
  doicon spotify/spotify.png
  make_desktop_entry ${PN} spotify.png 'Audio;Music;Player;AudioVideo;'
}
