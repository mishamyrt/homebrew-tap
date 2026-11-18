cask "tuna" do
  version "0.1.1"
  sha256 "cc561c11992a4cc37514e776463c25397690ea7870204efb051c1a97e5132c98"

  url "https://github.com/mishamyrt/tuna/releases/download/v0.1.1/Tuna.zip"
  name "Tuna"
  desc "Stereo monitoring calibration and parametric EQ"
  homepage "https://github.com/mishamyrt/tuna"

  depends_on macos: :sonoma

  audio_unit_plugin "Tuna.component"

  preflight_steps do
    run "/usr/bin/xattr", args: ["-drs", "com.apple.quarantine", "{{staged_path}}/Tuna.component"]
  end
end
