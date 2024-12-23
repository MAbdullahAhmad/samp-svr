#!/bin/bash

#
# Feature: Vehicle Spawner
#

ROOT=$(realpath "$(dirname ${BASH_SOURCE[0]})/../..")
DIST="$ROOT/dist/features"
INSTALL_DIR="$ROOT/samp03"
FEATURE_FILE="$ROOT/features.txt"
FEATURE_NAME="vehicle_spawner_by_ali_dollar"
ZIP_FILE="$DIST/$FEATURE_NAME.zip"

# Move to root directory
cd $ROOT

# Check if installation already exists
if [ -f "$FEATURE_FILE" ] && grep -q "$FEATURE_NAME" "$FEATURE_FILE"; then
    echo "Feature '$FEATURE_NAME' is already installed."
    exit 0
fi

# Verify the ZIP file exists
if [ ! -f "$ZIP_FILE" ]; then
    echo "Error: $ZIP_FILE does not exist. Please ensure the file is available."
    exit 1
fi

# Extract the feature
echo "Extracting feature files..."
unzip -o "$ZIP_FILE" -d "$ROOT"

# Move filterscripts
echo "Installing filterscript..."
mkdir -p "$INSTALL_DIR/filterscripts"
cp -f "$ROOT/$FEATURE_NAME/filterscripts/"*.amx "$INSTALL_DIR/filterscripts/"
cp -f "$ROOT/$FEATURE_NAME/filterscripts/"*.pwn "$INSTALL_DIR/filterscripts/"

# Move scriptfiles
echo "Installing scriptfiles..."
mkdir -p "$INSTALL_DIR/scriptfiles/VehicleSpawner"
cp -rf "$ROOT/$FEATURE_NAME/scriptfiles/VehicleSpawner/"* "$INSTALL_DIR/scriptfiles/VehicleSpawner/"

# Update server.cfg
if ! grep -q "VehicleSpawner" "$INSTALL_DIR/server.cfg"; then
    echo "Updating server.cfg..."
    sed -i '/^filterscripts /s/$/ VehicleSpawner/' "$INSTALL_DIR/server.cfg"
fi

# Update features.txt
echo "Recording feature installation..."
echo "$FEATURE_NAME" >> "$FEATURE_FILE"

# Cleanup
echo "Cleaning up temporary files..."
rm -rf "$ROOT/$FEATURE_NAME"

echo "Vehicle Spawner feature installed successfully."
