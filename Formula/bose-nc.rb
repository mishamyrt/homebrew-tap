class BoseNc < Formula
  desc "CLI tool for controlling Bose noise cancelling headphones"
  homepage "https://github.com/mishamyrt/bose-nc"
  url "https://github.com/mishamyrt/bose-nc/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"
  license "MIT"

  depends_on :macos
  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bose-nc --version")
  end
end
