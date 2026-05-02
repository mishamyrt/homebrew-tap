class Rakun < Formula
  desc "Remote repositories synchronizer"
  homepage "https://github.com/mishamyrt/rakun"
  version "0.1.0"
  license "GPL-3.0"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/mishamyrt/rakun/releases/download/v0.1.0/rakun_v0.1.0_darwin_arm64.tar.gz"
    sha256 "79f56b0e601792de2e34e790dfefc66897a21ad06dc2a6a8089ac861be4dfc8d"
  else
    url "https://github.com/mishamyrt/rakun/releases/download/v0.1.0/rakun_v0.1.0_darwin_amd64.tar.gz"
    sha256 "22ab67700b64a79c1ff84ed37f21a47c9baf3337fb20a598158e7d0a4af2e6e9"
  end

  def install
    bin.install "rakun"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rakun --version")
  end
end
