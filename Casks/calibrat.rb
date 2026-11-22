cask "calibrat" do
  version "0.1.1"
  sha256 "ac59e7a4dce2256e811ea5662478f806daa5f0b6685cb6e32ad01ab2b97e417b"

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
