#!/usr/bin/env bash
# 编译脚本：首次自动配置 CMake，随后以 Release 构建。
# 用法：./compile.sh
set -euo pipefail

SRC_SUBDIR="Assignment7"   # CMakeLists.txt 所在的子目录（相对本脚本）

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SRC_DIR="$SCRIPT_DIR/$SRC_SUBDIR"
BUILD_DIR="$SRC_DIR/build"

cd "$SRC_DIR"

if [ ! -f "$BUILD_DIR/CMakeCache.txt" ]; then
    echo "[compile] 首次配置 CMake (Visual Studio 17 2022, x64)..."
    cmake -S . -B build -G "Visual Studio 17 2022" -A x64
fi

echo "[compile] 构建 Release..."
cmake --build build --config Release
echo "[compile] 完成"
