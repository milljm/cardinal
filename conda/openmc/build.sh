#!/bin/bash
set -eu
export PATH=/bin:$PATH

export MOOSE_JOBS=${MOOSE_JOBS:-6}
export OPENMC_DIR=${PREFIX}/cardinal/contrib
export EIGEN3_DIR=${LIBMESH_DIR}/include

mkdir build; cd build
cmake -L \
  -DGIT_SUBMODULE=OFF \
  -DCMAKE_BUILD_TYPE=Release \
  -DOPENMC_USE_LIBMESH=ON \
  -DOPENMC_USE_MPI=ON \
  -DOPENMC_USE_DAGMC=ON \
  -DDAGMC_DIR=${DAGMC_DIR} \
  -DCMAKE_C_COMPILER=mpicc \
  -DCMAKE_CXX_COMPILER=mpicxx \
  -DCMAKE_PREFIX_PATH=${LIBMESH_DIR} \
  -DCMAKE_INSTALL_PREFIX=${OPENMC_DIR} \
  -DCMAKE_INSTALL_LIBDIR=lib \
  -DCMAKE_CXX_STANDARD=17 \
  ..

make -j ${MOOSE_JOBS}
make install

# Set OPENMC_* environment variable(s)
mkdir -p "${PREFIX}/etc/conda/activate.d" "${PREFIX}/etc/conda/deactivate.d"
cat <<EOF > "${PREFIX}/etc/conda/activate.d/activate_${PKG_NAME}.sh"
export OPENMC_DIR=${PREFIX}/cardinal/contrib
EOF
cat <<EOF > "${PREFIX}/etc/conda/deactivate.d/deactivate_${PKG_NAME}.sh"
unset OPENMC_DIR
EOF
