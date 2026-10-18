#!/usr/bin/env bash
set -e

APK_DIR="apk_disassembled"
OUTPUT_UNSIGNED="unsigned_patched.apk"
OUTPUT_DIR="signed_output"

echo "=== Building APK with apktool and AAPT2 ==="
java -jar apktool/apktool.jar b "$APK_DIR" -o "$OUTPUT_UNSIGNED" --use-aapt2

echo "=== Signing APK with uber-apk-signer ==="
java -jar apktool/uber-apk-signer.jar --apks "$OUTPUT_UNSIGNED" -o "$OUTPUT_DIR"

echo "=== Build and Sign Complete! ==="
echo "Signed APK located in: $OUTPUT_DIR/"
