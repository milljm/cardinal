#!/bin/bash
set -eu
export PATH=/bin:$PATH

export MOOSE_JOBS=${MOOSE_JOBS:-6}
export NEKRS_HOME=${PREFIX}/cardinal/contrib
export HDF5_ROOT=${PETSC_DIR}

# gslib: has some sort of issue with Condas PREFIX
export NO_PREFIX=${PREFIX}
unset PREFIX

mkdir build; cd build
cmake -DCMAKE_INSTALL_PREFIX=${NEKRS_HOME} \
  -DENABLE_CUDA=OFF \
  -DENABLE_HIP=OFF \
  -DNEKRS_GPU_MPI=ON \
  -DNEK5000_PPLIST="PARRSB DPROCMAP" \
  -DCMAKE_BUILD_TYPE=Release \
  ..

make -j ${MOOSE_JOBS}

# gslib: Put it back...
export PREFIX=${NO_PREFIX}
make install

# Set NEKRS_* environment variable(s)
mkdir -p "${PREFIX}/etc/conda/activate.d" "${PREFIX}/etc/conda/deactivate.d"
cat <<EOF > "${PREFIX}/etc/conda/activate.d/activate_${PKG_NAME}.sh"
export NEKRS_HOME=${PREFIX}/cardinal/contrib
export HDF5_ROOT=${PREFIX}
export PATH=\${PATH}:${PREFIX}/cardinal/contrib/bin
EOF
cat <<EOF > "${PREFIX}/etc/conda/deactivate.d/deactivate_${PKG_NAME}.sh"
unset NEKRS_HOME
unset HDF5_ROOT
export PATH=\${PATH%":${PREFIX}/cardinal/contrib/bin"}
EOF
