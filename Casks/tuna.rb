cask "tuna" do
  version "0.1.2"
  sha256 "4ce7b4f796c43ea5ae1c256061bbabd2c1c1b610fd34522e528284307ecfd160"

  url "https://github.com/mishamyrt/tuna/releases/download/v0.1.2/Tuna.zip"
  name "Tuna"
  desc "Stereo monitoring calibration and parametric EQ"
  homepage "https://github.com/mishamyrt/tuna"

  depends_on macos: :sonoma

  audio_unit_plugin "Tuna.component"

  preflight_steps do
    run "/usr/bin/xattr", args: ["-drs", "com.apple.quarantine", "{{staged_path}}/Tuna.component"]
  end
end
