cask "srez" do
  version "1.1.0"
  sha256 "3995c0c85e9b51e34bb7df413724acb24299c27337e6a9b99d414acbf89043e2"

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
