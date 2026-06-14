Stock OBS WHIP 230ms VBV Build

Scope
- Based on stock OBS Studio `32.1.2`
- WHIP/WebRTC VBV tuning for `NVIDIA NVENC` and `AMD AMF`
- Code path applies to `H.264`, `HEVC`, and `AV1` on supported NVIDIA/AMD hardware
- Directly tested with `NVIDIA NVENC H.264`

What Changed
- Added a WHIP-only `230ms` VBV override for `NVIDIA NVENC`
- Added a WHIP-only `230ms` VBV override for `AMD AMF`
- Retains stock OBS WHIP packet pacing and RTP timestamp behavior
- Leaves non-WHIP encoder settings untouched by restoring the original values on stop

Tested OBS Settings
- Encoder: `NVIDIA NVENC H.264`
- Rate control: `CBR`
- Bitrate: `11000 Kbps`
- Keyframe interval: `2s`
- Preset: `P5 Slow (Good Quality)`
- Tuning: `High Quality`
- Multipass: `Two Passes (Quarter Resolution)`
- Profile: `High`
- B-frames: `0`
- Lookahead: `Off`
- Adaptive Quantization: `On`
- Resolution / FPS: `1920x1080 @ 60fps`
