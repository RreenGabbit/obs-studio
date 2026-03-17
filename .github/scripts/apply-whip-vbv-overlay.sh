#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 2 ]]; then
  echo "usage: $0 <source-ref> <target-dir>" >&2
  exit 2
fi

source_ref=$1
target_dir=$2

files=(
  ".github/scripts/Build-Windows.ps1"
  ".github/workflows/build-patched.yaml"
  ".github/workflows/build-project.yaml"
  ".github/workflows/push.yaml"
  "cmake/common/versionconfig.cmake"
  "docs/whip-release-notes.md"
  "plugins/obs-ffmpeg/texture-amf.cpp"
  "plugins/obs-webrtc/whip-output.cpp"
  "plugins/obs-webrtc/whip-output.h"
)

for file in "${files[@]}"; do
  mkdir -p "${target_dir}/$(dirname "${file}")"
  git show "${source_ref}:${file}" > "${target_dir}/${file}"
done
