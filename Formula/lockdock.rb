class Lockdock < Formula
  desc "Remote repositories synchronizer"
  homepage "https://github.com/mishamyrt/lockdock"
  version "0.0.0"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/mishamyrt/rakun/releases/download/v0.1.1/rakun_v0.1.1_darwin_arm64.tar.gz"
    sha256 "fb1302821804f6090114cbbeae173760562cf6bb294bb90588d0187f246ba997"
  else
    url "https://github.com/mishamyrt/rakun/releases/download/v0.1.1/rakun_v0.1.1_darwin_amd64.tar.gz"
    sha256 "41f8efe5e43c6ecca4903c5098ac05f9990ea62c17dc8a2e45fa71dcc41b529c"
  end

  def install
    bin.install "rakun"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rakun --version")
  end
end
