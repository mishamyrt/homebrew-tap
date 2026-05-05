class Lockdock < Formula
  desc "macOS Dock position fixer"
  homepage "https://github.com/mishamyrt/lockdock"
  version "0.1.0"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/mishamyrt/lockdock/releases/download/v0.1.0/lockdock_v0.1.0_darwin_arm64.tar.gz"
    sha256 "24d5b7fe70bd1a81b92ab03f9c5190b6d44661ef5095e906c17a3e3ec1f31dd4"
  else
    url "https://github.com/mishamyrt/lockdock/releases/download/v0.1.0/lockdock_v0.1.0_darwin_amd64.tar.gz"
    sha256 "c22a8dac8d226cd28911d8b5d82f66a2713dd9c5df0255087575f43d685b13a6"
  end

  def install
    bin.install "lockdock"
    bin.install "lockdockd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/lockdock version")
  end
end
