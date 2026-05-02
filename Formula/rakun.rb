class Rakun < Formula
  desc "Remote repositories synchronizer"
  homepage "https://github.com/mishamyrt/rakun"
  license "GPL-3.0"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/mishamyrt/rakun/releases/download/v0.1.0/rakun_v0.1.0_darwin_arm64.tar.gz"
    sha256 "16026936f36a4c3ef283a0d0eb1ec4c369430e6121d835959e8b0f97f2f9069b"
  else
    url "https://github.com/mishamyrt/rakun/releases/download/v0.1.0/rakun_v0.1.0_darwin_amd64.tar.gz"
    sha256 "ed9a6f9470415f6723337cb258797e5c56933ab021fbaec572acc59cd71c4f11"
  end

  def install
    bin.install "rakun"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rakun --version")
  end
end
