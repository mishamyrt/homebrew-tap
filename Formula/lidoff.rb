class Lidoff < Formula
  desc "Daemon that turns off MacBook display brightness when lid is partially closed"
  homepage "https://github.com/mishamyrt/lidoff"
  url "https://github.com/mishamyrt/lidoff/archive/refs/tags/v0.3.2.tar.gz"
  sha256 "febea350c89efd5d87906186e80b946e11e4608ee6693aad752c98228585c304"
  license "MIT"

  depends_on :macos

  def install
    system "make"
    bin.install "build/lidoff"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/lidoff --version")
  end
end
