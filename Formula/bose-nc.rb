class BoseNc < Formula
  desc "CLI tool for controlling Bose noise cancelling headphones"
  homepage "https://github.com/mishamyrt/bose-nc"
  url "https://github.com/mishamyrt/bose-nc/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "6d9df89506c011931117abc318750c750b61070f3984414e2f336902c961f85c"
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
