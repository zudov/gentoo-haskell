# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

# ebuild generated by hackport 0.4.2.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour test-suite"
inherit haskell-cabal

DESCRIPTION="Haskell binding for Qt Quick"
HOMEPAGE="http://www.gekkou.co.uk/software/hsqml/"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE="+forceghcilib +threadedtestsuite usepkgconfig"

RDEPEND=">=dev-haskell/tagged-0.4:=[profile?] <dev-haskell/tagged-0.8:=[profile?]
	>=dev-haskell/text-0.11:=[profile?] <dev-haskell/text-1.2:=[profile?]
	>=dev-haskell/transformers-0.2:=[profile?] <dev-haskell/transformers-0.5:=[profile?]
	>=dev-lang/ghc-7.4.1:=
	dev-qt/qtdeclarative:5
	dev-qt/qtscript:5
	dev-qt/qtcore:5
	dev-qt/qtgui:5
	dev-qt/qtquick1:5
	dev-qt/qtwidgets:5
	sys-devel/gcc[cxx]
"
DEPEND="${RDEPEND}
	dev-haskell/c2hs
	>=dev-haskell/cabal-1.14
	virtual/pkgconfig
	test? ( >=dev-haskell/quickcheck-2.4 <dev-haskell/quickcheck-2.8 )
"

RESTRICT=test # needs X

src_configure() {
	haskell-cabal_src_configure \
		$(cabal_flag forceghcilib forceghcilib) \
		$(cabal_flag threadedtestsuite threadedtestsuite) \
		$(cabal_flag usepkgconfig usepkgconfig)
}
