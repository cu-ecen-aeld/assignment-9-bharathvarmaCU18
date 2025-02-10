#!/bin/sh

BUILDROOT_DIR="$(pwd)/buildroot"

if [ -d "$BUILDROOT_DIR" ]; then
    echo "Running 'make distclean' in $BUILDROOT_DIR..."
    make -C "$BUILDROOT_DIR" distclean
    echo "Buildroot cleanup completed."
else
    echo "Error: Buildroot directory not found at $BUILDROOT_DIR"
    exit 1
fi
