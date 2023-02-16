#!/bin/bash
set -eu
export PATH=/bin:$PATH

export MOOSE_JOBS=${MOOSE_JOBS:-6}
export DAGMC_DIR=${PREFIX}/cardinal/contrib
unset HDF5_ROOT

mkdir build; cd build
cmake -L \
  -DGIT_SUBMODULE=OFF \
  -DBUILD_TALLY=OFF \
  -DBUILD_TESTS=OFF \
  -DBUILD_CI_TESTS=OFF \
  -DBUILD_STATIC_LIBS=OFF \
  -DBUILD_STATIC_EXE=OFF \
  -DMOAB_DIR=${MOAB_DIR} \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_C_COMPILER=mpicc \
  -DCMAKE_CXX_COMPILER=mpicxx \
  -DCMAKE_PREFIX_PATH=${LIBMESH_DIR} \
  -DCMAKE_INSTALL_PREFIX=${DAGMC_DIR} \
  ../cardinal/contrib/DAGMC

make -j ${MOOSE_JOBS}
make install

# Set DAGMC_* environment variable(s)
mkdir -p "${PREFIX}/etc/conda/activate.d" "${PREFIX}/etc/conda/deactivate.d"
cat <<EOF > "${PREFIX}/etc/conda/activate.d/activate_${PKG_NAME}.sh"
export DAGMC_DIR=${PREFIX}/cardinal/contrib
EOF
cat <<EOF > "${PREFIX}/etc/conda/deactivate.d/deactivate_${PKG_NAME}.sh"
unset DAGMC_DIR
EOF
