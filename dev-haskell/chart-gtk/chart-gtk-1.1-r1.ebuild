# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

# ebuild generated by hackport 0.3.4.9999

GTK_MAJ_VER="2"

CABAL_FEATURES="lib profile haddock hoogle hscolour"
inherit haskell-cabal

MY_PN="Chart-gtk"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Utility functions for using the chart library with GTK"
HOMEPAGE="https://github.com/timbod7/haskell-chart/wiki"
SRC_URI="mirror://hackage/packages/archive/${MY_PN}/${PV}/${MY_P}.tar.gz"

LICENSE="BSD"
SLOT="${GTK_MAJ_VER}/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-haskell/cairo-0.9.11:${GTK_MAJ_VER}=[profile?] <dev-haskell/cairo-0.12.5.0:${GTK_MAJ_VER}=[profile?]
	>=dev-haskell/chart-1.1:=[profile?] <dev-haskell/chart-1.2:=[profile?]
	>=dev-haskell/chart-cairo-1.1:${GTK_MAJ_VER}=[profile?] <dev-haskell/chart-cairo-1.2:${GTK_MAJ_VER}=[profile?]
	>=dev-haskell/colour-2.2.1:=[profile?] <dev-haskell/colour-2.4:=[profile?]
	>=dev-haskell/gtk-0.9.11:${GTK_MAJ_VER}=[profile?] <dev-haskell/gtk-0.12.5.0:${GTK_MAJ_VER}=[profile?]
	dev-haskell/mtl:=[profile?]
	>=dev-lang/ghc-6.12.1:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.8.0.2
"

S="${WORKDIR}/${MY_P}"

src_prepare() {
	# Need stricter deps to select the gtk+2 stuff
	CABAL_FILE=${S}/${MY_PN}.cabal cabal_chdeps \
		'cairo >= 0.9.11' 'cairo >= 0.9.11 && < 0.12.5.0' \
		'gtk >= 0.9.11' 'gtk >= 0.9.11 && < 0.12.5.0'
}