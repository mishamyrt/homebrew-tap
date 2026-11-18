cask "tuna" do
  version "0.1.0"
  sha256 "5adf20c29788e31b96e06a06872488b320aa39ad7c95da5dca268f3850184cdc"

  url "https://github.com/mishamyrt/tuna/releases/download/v0.1.0/Tuna.zip"
  name "Tuna"
  desc "Stereo monitoring calibration and parametric EQ"
  homepage "https://github.com/mishamyrt/tuna"

  depends_on macos: :sonoma

  audio_unit_plugin "Tuna.component"
end
