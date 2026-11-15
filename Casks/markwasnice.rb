cask "markwasnice" do
  version "1.0.0"
  sha256 "f9c25613bf9754c798da015c2f43868bedd9d87c3234e850773e1dab5d54c274"

  url "https://github.com/mishamyrt/markwasnice/releases/download/v#{version}/Markwasnice-arm64.dmg"
  name "Markwasnice"
  desc "Opinionated Markdown editor"
  homepage "https://github.com/mishamyrt/markwasnice"

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "Markwasnice.app"

  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "{{appdir}}/Markwasnice.app"]
  end
end
