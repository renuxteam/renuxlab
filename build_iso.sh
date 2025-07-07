#!/bin/bash
# 🚀 RenuxLab ISO Build Script
# This script automates the creation of a minimal Arch-based ISO (RenuxLab).

set -e  # Stop script if any command fails

# === CONFIGURATION ===
# Path to your archiso releng directory
ARCHISO_DIR="./archiso/releng"

# Working directory for temporary build files
WORK_DIR="./work"

# Output directory where the ISO will be placed
OUT_DIR="./out"

# ISO Label
ISO_LABEL="RenuxLab"

# === CHECK DEPENDENCIES ===
# Make sure 'archiso' package is installed
if ! command -v mkarchiso &> /dev/null; then
  echo "==> Error: 'archiso' is not installed. Install it with: sudo pacman -S archiso"
  exit 1
fi

# === CLEAN PREVIOUS BUILD (Optional, can be removed if you prefer incremental builds) ===
echo "==> Cleaning previous build directories..."
rm -rf "$WORK_DIR" "$OUT_DIR"

# === BUILD ISO ===
echo "==> Starting ISO build..."
sudo mkarchiso -v -w "$WORK_DIR" -o "$OUT_DIR" "$ARCHISO_DIR"

# === DONE ===
echo "==> ISO Build complete!"
echo "ISO saved at: $OUT_DIR"
