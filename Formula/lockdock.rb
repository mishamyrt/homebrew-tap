class Lockdock < Formula
  desc "macOS Dock position fixer"
  homepage "https://github.com/mishamyrt/lockdock"
  version "0.1.1"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/mishamyrt/lockdock/releases/download/v0.1.1/lockdock_v0.1.1_darwin_arm64.tar.gz"
    sha256 "2135a17c468463ff507943cca86f368871e21f1ba6563b0809f3bef87f2ddbf8"
  else
    url "https://github.com/mishamyrt/lockdock/releases/download/v0.1.1/lockdock_v0.1.1_darwin_amd64.tar.gz"
    sha256 "36655204d2e621f93b906ef4d99c21ce76edf24c43466acb883658606e2e0c16"
  end

  def install
    bin.install "lockdock"
    bin.install "lockdockd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/lockdock version")
  end
end
