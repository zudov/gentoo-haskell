# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

# ebuild generated by hackport 0.3.2.9999

CABAL_FEATURES="bin lib profile haddock hoogle hscolour test-suite"
inherit eutils haskell-cabal

DESCRIPTION="Cloud Haskell: Erlang-style concurrency in Haskell"
HOMEPAGE="http://github.com/haskell-distributed/distributed-process"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-haskell/binary-0.5:=[profile?] <dev-haskell/binary-0.8:=[profile?]
		=dev-haskell/data-accessor-0.2*:=[profile?]
		=dev-haskell/distributed-static-0.2*:=[profile?]
		>=dev-haskell/mtl-2.0:=[profile?] <dev-haskell/mtl-2.3:=[profile?]
		=dev-haskell/network-transport-0.3*:=[profile?]
		=dev-haskell/random-1.0*:=[profile?]
		=dev-haskell/rank1dynamic-0.1*:=[profile?]
		>=dev-haskell/stm-2.3:=[profile?] <dev-haskell/stm-2.5:=[profile?]
		>=dev-haskell/syb-0.3:=[profile?] <dev-haskell/syb-0.5:=[profile?]
		>=dev-haskell/transformers-0.2:=[profile?] <dev-haskell/transformers-0.5:=[profile?]
		>=dev-lang/ghc-7.4.1:="
DEPEND="${RDEPEND}
		test? ( >=dev-haskell/ansi-terminal-0.5 <dev-haskell/ansi-terminal-0.7
			=dev-haskell/hunit-1.2*
			>=dev-haskell/network-2.3 <dev-haskell/network-2.7
			=dev-haskell/network-transport-tcp-0.3*
			>=dev-haskell/test-framework-0.6 <dev-haskell/test-framework-0.9
			>=dev-haskell/test-framework-hunit-0.2.0 <dev-haskell/test-framework-hunit-0.4
		)
		>=dev-haskell/cabal-1.8"

src_prepare() {
	epatch "${FILESDIR}"/${P}-ghc-7.8.patch

	cabal_chdeps \
		'ansi-terminal >= 0.5 && < 0.6' 'ansi-terminal >= 0.5 && < 0.7' \
		'binary >= 0.5 && < 0.7' 'binary >= 0.5 && < 0.9' \
		'syb >= 0.3 && < 0.4' 'syb >= 0.3 && < 0.5' \
		'transformers >= 0.2 && < 0.4' 'transformers >= 0.2 && < 0.5' \
		'mtl >= 2.0 && < 2.2' 'mtl >= 2.0 && < 2.3' \
		'template-haskell >= 2.6 && < 2.9' 'template-haskell >= 2.6 && < 2.10' \
		'network >= 2.3 && < 2.5' 'network >= 2.3 && < 2.7'

	sed -e 's@\(by Hans Svensson, L\).*\( Fredlund and Clara Benac Earle\)@\1.\2@' \
		-i "${S}/${PN}.cabal" \
		|| die "Could patch ${PN}.cabal to workaround haddock error"
}

src_configure() {
	haskell-cabal_src_configure \
		--flag=-benchmarks \
		--flag=th
}
