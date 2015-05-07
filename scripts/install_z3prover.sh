#!/usr/bin/env sh

basedir=$(pwd)
targetdir="$basedir/local"

if [ ! -d "$targetdir" ]; then
  mkdir -p "$targetdir"

  echo Cloning z3: branch $Z3_BRANCH
  git clone --depth 1 --branch "$Z3_BRANCH" https://github.com/Z3Prover/z3.git

  echo Build and install z3 into directory $targetdir
  cd z3
  git branch
  python scripts/mk_make.py --prefix="$targetdir"
  cd build
  make
  make install
fi
