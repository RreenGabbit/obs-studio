WHIP Fix Build v1

Scope
- Validated for `NVIDIA NVENC H.264` over `WHIP/WebRTC`
- Not validated for `AV1`
- Not validated for `AMD` encoders

Base
- Branch: `whip-pacing-fix`
- Recommended commit/build: `b9c231bfc`
- Note: `b9c231bfc` is functionally the same WHIP code state as `69db9bd3e`

What Changed
- Restored upstream WHIP pacing interval to `5ms`
- Kept WHIP pacing budget at `10x`
- Added RTCP `PLI/FIR` handling to request an immediate NVENC IDR for recovery
- Reduced `MAX_VIDEO_FRAGMENT_SIZE` from `1200` to `1000`
- Added a WHIP-only NVENC VBV override of about `250ms`
- Restored encoder option overrides on stop so the changes stay scoped to WHIP output

What Worked Best In Testing
- Long freezes were eliminated or reduced to very rare cases
- Packet loss dropped to zero in the best tests
- Static-to-motion recovery became much better than earlier builds
- Remaining issue: small visible quality drop or minor hitch can still happen on keyframes

Changes That Were Tested And Rejected
- Slower pacing intervals like `17ms` or `33ms`: caused bursty/stuttery output
- Lower pacing budget (`5x`): made keyframe stutter longer
- Infinite/manual-only GOP: caused bad static-to-motion freezes
- Larger VBV (`375ms`): reintroduced packet loss/freezes

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

Notes
- RTMP can look fine while WHIP/WebRTC still shows keyframe-related issues; that is expected.
- This build is aimed at SRS/WHIP low-latency behavior, not RTMP.
- The tested recovery and encoder override path is NVIDIA-specific in this branch.
- If keyframe artifacts are still too visible, the next likely area is receiver/playout behavior rather than more sender pacing changes.
