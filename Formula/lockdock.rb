class Lockdock < Formula
  desc "macOS Dock position fixer"
  homepage "https://github.com/mishamyrt/lockdock"
  version "0.1.1"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/mishamyrt/lockdock/releases/download/v0.1.1/lockdock_v0.1.1_darwin_arm64.tar.gz"
    sha256 "6eb5d8d80b83aeb3b1a134bbe2ea7ce1c1cbeee6acf2a48d346ebe350cb3161d"
  else
    url "https://github.com/mishamyrt/lockdock/releases/download/v0.1.1/lockdock_v0.1.1_darwin_amd64.tar.gz"
    sha256 "c5a5d3a0e4ac846315561d24ed40e4c6d5d55da432bc8ef12b61896b66f7f088"
  end

  def install
    bin.install "lockdock"
    bin.install "lockdockd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/lockdock version")
  end
end
