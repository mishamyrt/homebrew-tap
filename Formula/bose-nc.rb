class BoseNc < Formula
  desc "CLI tool for controlling Bose noise cancelling headphones"
  homepage "https://github.com/mishamyrt/bose-nc"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/mishamyrt/bose-nc/releases/download/v0.3.0/bose-nc-aarch64-apple-darwin.tar.xz"
    sha256 "16026936f36a4c3ef283a0d0eb1ec4c369430e6121d835959e8b0f97f2f9069b"
  else
    url "https://github.com/mishamyrt/bose-nc/releases/download/v0.3.0/bose-nc-x86_64-apple-darwin.tar.xz"
    sha256 "ed9a6f9470415f6723337cb258797e5c56933ab021fbaec572acc59cd71c4f11"
  end

  def install
    bin.install "bose-nc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bose-nc version")
  end
end
