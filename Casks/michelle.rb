cask "michelle" do
  version "0.3.0"
  sha256 "98a4308580d93411eda8d70644ab713a11dc405115581453baaa7edd589abb19"

  url "https://github.com/mishamyrt/michelle/releases/download/v0.3.0/Michelle-0.3.0.dmg"
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
