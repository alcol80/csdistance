#!/usr/bin/env sh

basedir=$(pwd)
targetdir="$basedir/local"
mkdir -p "$targetdir"

echo Cloning z3: branch $Z3_BRANCH
git clone --depth 1 --branch "$Z3_BRANCH" https://github.com/Z3Prover/z3.git

echo Build and install z3 into directory $targetdir
cd z3
python scripts/mk_make.py --prefix="$targetdir"
cd build
make
make install
