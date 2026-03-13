WHIP Fix Build v1

Scope
- Validated for `NVIDIA NVENC H.264` over `WHIP/WebRTC`
- Not validated for `AV1`
- Not validated for `AMD` encoders

What Changed
- Added RTCP `PLI/FIR` handling to request an immediate NVENC IDR for recovery
- Reduced `MAX_VIDEO_FRAGMENT_SIZE` from `1200` to `1000`
- Added a WHIP-only NVENC VBV override of about `250ms`

Recommended OBS Settings
- Encoder: `NVIDIA NVENC H.264`
- Rate control: `CBR`
- Bitrate: `8000 Kbps`
- Keyframe interval: `1s`
- Preset: `P3`
- Tuning: `Ultra Low Latency`
- Multipass: `Disabled`
- Profile: `High`
- B-frames: `0`
- Lookahead: `Off`
- Adaptive Quantization: `Off`
- Resolution / FPS: `1920x1080 @ 60fps`
