#!/bin/bash
set -eu
export PATH=/bin:$PATH

export MOOSE_JOBS=${MOOSE_JOBS:-6}
export MOAB_DIR=${PREFIX}/cardinal/contrib
export HDF5_ROOT=${PETSC_DIR}

mkdir build; cd build
cmake -L \
  -DENABLE_HDF5=ON \
  -DENABLE_TESTING=OFF \
  -DENABLE_BLASLAPACK=OFF \
  -DEIGEN3_DIR=${LIBMESH_DIR}/include \
  -DHDF5_DIR=${HDF5_ROOT} \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_C_COMPILER=mpicc \
  -DCMAKE_CXX_COMPILER=mpicxx \
  -DCMAKE_Fortran_COMPILER=mpif90 \
  -DCMAKE_PREFIX_PATH=${LIBMESH_DIR} \
  -DCMAKE_INSTALL_PREFIX=${MOAB_DIR} \
  -DCMAKE_INSTALL_RPATH="${HDF5_ROOT}/lib;${MOAB_DIR}/lib" \
  -DCMAKE_INSTALL_LIBDIR=lib \
  ..

make -j ${MOOSE_JOBS}
make install

# Set MOAB_* environment variable(s)
mkdir -p "${PREFIX}/etc/conda/activate.d" "${PREFIX}/etc/conda/deactivate.d"
cat <<EOF > "${PREFIX}/etc/conda/activate.d/activate_${PKG_NAME}.sh"
export MOAB_DIR=${PREFIX}/cardinal/contrib
EOF
cat <<EOF > "${PREFIX}/etc/conda/deactivate.d/deactivate_${PKG_NAME}.sh"
unset MOAB_DIR
EOF
