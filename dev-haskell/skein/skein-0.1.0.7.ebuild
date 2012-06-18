# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

# ebuild generated by hackport 0.2.13

EAPI="4"

CABAL_FEATURES="lib profile haddock hscolour hoogle"
inherit haskell-cabal

DESCRIPTION="Skein, a family of cryptographic hash functions.  Includes Skein-MAC as well."
HOMEPAGE="http://hackage.haskell.org/package/skein"
SRC_URI="http://hackage.haskell.org/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"
RESTRICT="test" # fails to compile: tests/runtests.hs:143:41: Not in scope: type constructor or class `ItSpec'

RDEPEND="=dev-haskell/cereal-0.3*[profile?]
		<dev-haskell/crypto-api-0.11[profile?]
		>=dev-haskell/tagged-0.2[profile?]
		<dev-haskell/tagged-0.5[profile?]
		>=dev-lang/ghc-6.8.2"
DEPEND="${RDEPEND}
		>=dev-haskell/cabal-1.8
		test? (  >=dev-haskell/cabal-1.10
				<=dev-haskell/hspec-1.1[profile?]
				dev-haskell/transformers[profile?]
		)"

src_prepare() {
	sed -e 's@hspec        == 0.9.\*@hspec        >= 0.9 \&\& < 1.2@' \
		-e 's@bytestring   >= 0.9 && < 0.10@bytestring   >= 0.9 \&\& < 0.11@' \
		-i "${S}/${PN}.cabal" || die "Could not loosen dependencies"
	# Copy the missing test, upstream never run it anyway, it fails to compile
	cp "${FILESDIR}/runtests.hs" "${S}/tests"
}

src_configure() {
	cabal_src_configure $(use_enable test tests)
}
