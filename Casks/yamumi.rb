cask "yamumi" do
  version "1.4.0"
  sha256 "525d928d95ca54720ad6175599bdbba3165ae1a392b0907b789c0de9fde6ead9"

  url "https://github.com/Yamumi-app/releases/releases/download/v#{version}/Yamumi.dmg"
  name "Yamumi"
  desc "Native macOS player for Yandex Music"
  homepage "https://yamumi.myrt.co"

  depends_on arch: :arm64, macos: :sequoia

  app "Yamumi.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-drs", "com.apple.quarantine", "{{appdir}}/Yamumi.app"]
  end
end
