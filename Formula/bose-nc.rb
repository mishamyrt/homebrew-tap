class BoseNc < Formula
  desc "CLI tool for controlling Bose noise cancelling headphones"
  homepage "https://github.com/mishamyrt/bose-nc"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/mishamyrt/bose-nc/releases/download/v0.2.1/bose-nc-aarch64-apple-darwin.tar.xz"
    sha256 "30350e841618434499db3c605ed88be1235ccc7c48e3c12afa5516e01fccbdf8"
  else
    url "https://github.com/mishamyrt/bose-nc/releases/download/v0.2.1/bose-nc-x86_64-apple-darwin.tar.xz"
    sha256 "330b9563f7113b5e5ea774239e1621b4bfb6c50657863118274af0ddcc3ed0c4"
  end

  def install
    bin.install "bose-nc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bose-nc version")
  end
end
