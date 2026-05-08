class Lockdock < Formula
  desc "macOS Dock position fixer"
  homepage "https://github.com/mishamyrt/lockdock"
  version "0.2.0"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/mishamyrt/lockdock/releases/download/v0.2.0/lockdock_v0.2.0_darwin_arm64.tar.gz"
    sha256 "1d92e0cd7d2563af8fa4c253808f86d97367626cb02989d25158920148203705"
  else
    url "https://github.com/mishamyrt/lockdock/releases/download/v0.2.0/lockdock_v0.2.0_darwin_amd64.tar.gz"
    sha256 "ec634a8c8ea5973f315ff0b05d770e6fcd8fd83276feee46e266fd4c55f0d9bb"
  end

  def install
    bin.install "lockdock"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/lockdock version")
  end
end
