class Lockdock < Formula
  desc "macOS Dock position fixer"
  homepage "https://github.com/mishamyrt/lockdock"
  version "0.1.0"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/mishamyrt/lockdock/releases/download/v0.1.0/lockdock_v0.1.0_darwin_arm64.tar.gz"
    sha256 "cdc9b7ee7d4064924f19ae00f6b5159d7a550287bc35f3c9b433bb40de6c4118"
  else
    url "https://github.com/mishamyrt/lockdock/releases/download/v0.1.0/lockdock_v0.1.0_darwin_amd64.tar.gz"
    sha256 "544f9702a5dd7d8be806f820acbe8854d6f23ea2dfb1af703570229b4048005c"
  end

  def install
    bin.install "lockdock"
    bin.install "lockdockd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/lockdock version")
  end
end
