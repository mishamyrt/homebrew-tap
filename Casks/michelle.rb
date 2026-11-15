cask "michelle" do
  version "0.2.1"
  sha256 "c92f9ae2f9049789c1f90c3c4993cd37adbecc145975b8953ddb365311ffab38"

  url "https://github.com/mishamyrt/michelle/releases/download/v0.2.1/Michelle-0.2.1.dmg"
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
