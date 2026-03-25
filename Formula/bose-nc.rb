class BoseNc < Formula
  desc "CLI tool for controlling Bose noise cancelling headphones"
  homepage "https://github.com/mishamyrt/bose-nc"
  version "0.1.0"
  license "MIT"

  on_arm do
    url "https://github.com/mishamyrt/bose-nc/releases/download/v0.1.0/bose-nc-aarch64-apple-darwin.tar.xz"
    sha256 "0000000000000000000000000000000000000000000000000000000000000000"
  end

  on_intel do
    url "https://github.com/mishamyrt/bose-nc/releases/download/v0.1.0/bose-nc-x86_64-apple-darwin.tar.xz"
    sha256 "0000000000000000000000000000000000000000000000000000000000000000"
  end

  depends_on :macos

  def install
    bin.install "bose-nc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bose-nc --version")
  end
end
