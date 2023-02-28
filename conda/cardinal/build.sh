#!/bin/bash
set -eu
export PATH=/bin:$PATH

export MOOSE_JOBS=${MOOSE_JOBS:-6}
export CONTRIB_INSTALL_DIR=${PREFIX}/cardinal/contrib
export NEKRS_HOME=${CONTRIB_INSTALL_DIR}
export HDF5_ROOT=${PETSC_DIR}
export MOOSE_SKIP_DOCS=True
export METHOD=opt

# gslib inside nekRS contrib: has some sort of issue with Condas PREFIX
export OLD_PREFIX=${PREFIX}
unset PREFIX

cd contrib/moose
./configure --prefix=${OLD_PREFIX}/cardinal
cd ../../
make build_nekrs MAKEFLAGS=-j${MOOSE_JOBS}
make build_openmc MAKEFLAGS=-j${MOOSE_JOBS} HDF5_ROOT=${PETSC_DIR}
make -j ${MOOSE_JOBS}
make install -j ${MOOSE_JOBS}

# gslib inside nekRS contrib: Put it back...
export PREFIX=${OLD_PREFIX}

# Copy cross section download script so the user may run tests
cp scripts/download-test-suite-cross-sections.sh ${PREFIX}/cardinal/bin/

# Set NEKRS_* environment variable(s)
mkdir -p "${PREFIX}/etc/conda/activate.d" "${PREFIX}/etc/conda/deactivate.d"
cat <<EOF > "${PREFIX}/etc/conda/activate.d/activate_${PKG_NAME}.sh"
export PATH=\${PATH}:${PREFIX}/cardinal/bin:${PREFIX}/cardinal/contrib/bin
EOF
cat <<EOF > "${PREFIX}/etc/conda/deactivate.d/deactivate_${PKG_NAME}.sh"
export PATH=\${PATH%":${PREFIX}/cardinal/bin"}
export PATH=\${PATH%":${PREFIX}/cardinal/contrib/bin"}
EOF
