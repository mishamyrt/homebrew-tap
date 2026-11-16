cask "srez" do
  version "1.0.0"
  sha256 "49f84d65398e27d02cf1addb09fb75877d2a7cfc03ac603eae478f7fea1257a4"

  url "https://github.com/mishamyrt/srez/releases/download/v#{version}/Srez-v#{version}-macos-arm64.zip"
  name "Srez"
  desc "Meeting transcription and summarization"
  homepage "https://github.com/mishamyrt/srez"

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Srez.app"

  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "{{appdir}}/Srez.app"]
  end
end
