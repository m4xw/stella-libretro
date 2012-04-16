#!/bin/sh

die()
{
   echo $1
   #exit 1
}

build_libretro_bsnes()
{
   if [ -d "libretro-bsnes/perf" ]; then
      echo "=== Building bSNES performance ==="
      cd libretro-bsnes/perf
      make profile=performance -j4 || die "Failed to build bSNES performance core"
      cp -f out/libretro.so ../libretro-performance.so
      cd ../..
   else
      echo "bSNES performance not fetched, skipping ..."
   fi

   if [ -d "libretro-bsnes/compat" ]; then
      echo "=== Building bSNES compatibility ==="
      cd libretro-bsnes/compat
      make profile=compatibility -j4 || die "Failed to build bSNES compatibility core"
      cp -f out/libretro.so ../libretro-compat.so
      cd ../..
   else
      echo "bSNES compat not fetched, skipping ..."
   fi

   if [ -d "libretro-bsnes" ]; then
      echo "=== Building bSNES accuracy ==="
      cd libretro-bsnes
      make profile=accuracy -j4 || die "Failed to build bSNES accuracy core"
      cp -f out/libretro.so libretro-accuracy.so
      cd ..
   fi
}

build_libretro_s9x()
{
   if [ -d "libretro-s9x" ]; then
      echo "=== Building SNES9x ==="
      cd libretro-s9x/libretro
      make -j4 || die "Failed to build SNES9x"
      cp libretro.so ../libretro-snes9x.so
      cd ../..
   else
      echo "SNES9x not fetched, skipping ..."
   fi
}

build_libretro_s9x_next()
{
   if [ -d "libretro-s9x-next" ]; then
      echo "=== Building SNES9x-Next ==="
      cd libretro-s9x-next/
      make -f Makefile.libretro -j4 || die "Failed to build SNES9x-Next"
      cp libretro.so libretro-snes9x-next.so
      cd ..
   else
      echo "SNES9x-Next not fetched, skipping ..."
   fi
}

build_libretro_genplus()
{
   if [ -d "libretro-genplus" ]; then
      echo "=== Building Genplus GX ==="
      cd libretro-genplus/
      make -f Makefile.libretro -j4 || die "Failed to build Genplus GX"
      cp libretro.so libretro-genplus.so
      cd ..
   else
      echo "Genplus GX not fetched, skipping ..."
   fi
}

build_libretro_fba()
{
   if [ -d "libretro-fba" ]; then
      echo "=== Building Final Burn Alpha ==="
      cd libretro-fba/
      ./compile_libretro.sh make || die "Failed to build Final Burn Alpha"
      cp src-0.2.97.24/libretro.so libretro-fba.so
      cd ..
   else
      echo "Final Burn Alpha not fetched, skipping ..."
   fi
}

build_libretro_vba()
{
   if [ -d "libretro-vba" ]; then
      echo "=== Building VBA-Next ==="
      cd libretro-vba/
      make -f Makefile.libretro -j4 || die "Failed to build VBA-Next"
      cp libretro.so libretro-vba.so
      cd ..
   else
      echo "VBA-Next not fetched, skipping ..."
   fi
}

build_libretro_bnes()
{
   if [ -d "libretro-bnes" ]; then
      echo "=== Building bNES ==="
      cd libretro-bnes
      mkdir -p obj
      make -j4 || die "Failed to build bNES"
      cp libretro.so libretro-bnes.so
      cd ..
   else
      echo "bNES not fetched, skipping ..."
   fi
}

build_libretro_fceu()
{
   if [ -d "libretro-fceu" ]; then
      echo "=== Building FCEU ==="
      cd libretro-fceu
      make -f Makefile.libretro-fceumm -j4 || die "Failed to build FCEU"
      cp libretro.so libretro-fceu.so
      cd ..
   else
      echo "FCEU not fetched, skipping ..."
   fi
}

build_libretro_gambatte()
{
   if [ -d "libretro-gambatte" ]; then
      echo "=== Building Gambatte ==="
      cd libretro-gambatte/libgambatte
      make -f Makefile.libretro -j4 || die "Failed to build Gambatte"
      cp libretro.so ../libretro-gambatte.so
      cd ../..
   else
      echo "Gambatte not fetched, skipping ..."
   fi
}

build_libretro_meteor()
{
   if [ -d "libretro-meteor" ]; then
      echo "=== Building Meteor ==="
      cd libretro-meteor/libretro
      make -j4 || die "Failed to build Meteor"
      cp libretro.so ../libretro-meteor.so
      cd ../
   else
      echo "Meteor not fetched, skipping ..."
   fi
}


build_libretro_bsnes
build_libretro_s9x
build_libretro_s9x_next
build_libretro_genplus
build_libretro_fba
build_libretro_vba
build_libretro_bnes
build_libretro_fceu
build_libretro_gambatte
build_libretro_meteor

