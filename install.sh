#!/bin/bash
SKELETON_DIR=`puppet config print module_skeleton_dir`
mkdir -p "${SKELETON_DIR}"
find skeleton -type f | git checkout-index --stdin --force --prefix="${SKELETON_DIR}" --
