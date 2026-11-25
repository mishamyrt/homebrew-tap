cask "michelle" do
  version "0.3.1"
  sha256 "c8555ae1518de652348c9bc8055b745ec88eb6b6228d971cfd74ef4228a92df7"

  url "https://github.com/mishamyrt/michelle/releases/download/v0.3.1/Michelle-0.3.1.dmg"
  name "Michelle"
  desc "Native macOS client for local coding agents"
  homepage "https://github.com/mishamyrt/michelle"

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Michelle.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Michelle.app"]
  end
end
