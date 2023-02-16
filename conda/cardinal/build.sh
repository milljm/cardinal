#!/bin/bash
set -eu
export PATH=/bin:$PATH

export MOOSE_JOBS=${MOOSE_JOBS:-6}
export CONTRIB_INSTALL_DIR=${PREFIX}/cardinal/contrib
export MOOSE_SKIP_DOCS=True
export METHOD=opt
export ENABLE_DAGMC=yes

cd contrib/moose
./configure --prefix=${PREFIX}/cardinal
cd ../../
make -j ${MOOSE_JOBS}
make install -j ${MOOSE_JOBS}

# Set NEKRS_* environment variable(s)
mkdir -p "${PREFIX}/etc/conda/activate.d" "${PREFIX}/etc/conda/deactivate.d"
cat <<EOF > "${PREFIX}/etc/conda/activate.d/activate_${PKG_NAME}.sh"
export NEKRS_HOME=${PREFIX}/cardinal/contrib
export PATH=\${PATH}:${PREFIX}/cardinal/bin
EOF
cat <<EOF > "${PREFIX}/etc/conda/deactivate.d/deactivate_${PKG_NAME}.sh"
unset NEKRS_HOME
export PATH=\${PATH%":${PREFIX}/cardinal/bin"}
EOF
