cask "calibrat" do
  version "0.1.2"
  sha256 "993f26feb36555477d9bac631970e7ff1fec24c94d23f718eac2733cc41f66ad"

  url "https://github.com/mishamyrt/calibrat-releases/releases/download/v#{version}/Calibrat-#{version}.dmg"
  name "Calibrat"
  desc "Display calibration and profiling for macOS"
  homepage "https://github.com/mishamyrt/calibrat-releases"

  depends_on arch: :arm64, macos: :golden_gate

  app "Calibrat.app"

  preflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{staged_path}}/Calibrat.app"]
  end
end
