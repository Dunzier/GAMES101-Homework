#!/usr/bin/env bash
# 运行脚本：执行 Release 编译产物。
# 用法：./run.sh [参数...]
set -euo pipefail

SRC_SUBDIR="Assignment7"    # 同 compile.sh
EXE_NAME="RayTracing"       # 可执行文件名（不含 .exe）

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SRC_DIR="$SCRIPT_DIR/$SRC_SUBDIR"
EXE="$SRC_DIR/build/Release/$EXE_NAME.exe"

if [ ! -f "$EXE" ]; then
    echo "[run] 未找到可执行文件：$EXE" >&2
    echo "[run] 请先运行 ./compile.sh 编译。" >&2
    exit 1
fi

cd "$SRC_DIR"
exec "$EXE" "$@"
