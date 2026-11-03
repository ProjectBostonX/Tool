#!/bin/bash
set -euo pipefail

echo "============================================================"
echo " Project X Boston Recovery Builder"
echo " Created by luhhcarrl2x"
echo " Device: ${DEVICE_NAME:-boston} | ${RECOVERY_TYPE:-twrp} | Motorola Moto G Stylus 5G 2024"
echo "============================================================"

default_workspace="${GITHUB_WORKSPACE:-$PWD}"
if [ -d "${default_workspace}/workspace" ]; then
  cd "${default_workspace}/workspace"
else
  echo "Workspace directory not found at ${default_workspace}/workspace"
  exit 1
fi

if [ -f build/envsetup.sh ]; then
  source build/envsetup.sh
else
  echo "Android build environment not initialized in workspace. Check repo sync and manifest configuration."
  exit 1
fi

export ALLOW_MISSING_DEPENDENCIES=true
export LC_ALL=C
export TARGET_PRODUCT="${MAKEFILE_NAME:-twrp_boston}"

DEVICE_NAME="${DEVICE_NAME:-boston}"
MAKEFILE_NAME="${MAKEFILE_NAME:-twrp_boston}"
BUILD_TARGET="${BUILD_TARGET:-recovery}"

if [ -n "${MAKEFILE_NAME}" ]; then
  echo "Attempting lunch target: ${MAKEFILE_NAME}-eng"
  lunch "${MAKEFILE_NAME}"-eng || lunch "${MAKEFILE_NAME}"-userdebug || lunch "${MAKEFILE_NAME}"-user
fi

make clean
make "${BUILD_TARGET}image" -j"$(nproc --all)"

OUTPUT_DIR="out/target/product/${DEVICE_NAME}"
if [ -d "${OUTPUT_DIR}" ]; then
  echo "Built artifacts in ${OUTPUT_DIR}:"
  ls -lh "${OUTPUT_DIR}"
else
  echo "No build output found under ${OUTPUT_DIR}"
  find out -maxdepth 4 -type f | head -n 25 || true
  exit 1
fi
