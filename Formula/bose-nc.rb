class BoseNc < Formula
  desc "CLI tool for controlling Bose noise cancelling headphones"
  homepage "https://github.com/mishamyrt/bose-nc"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/mishamyrt/bose-nc/releases/download/v0.2.2/bose-nc-aarch64-apple-darwin.tar.xz"
    sha256 "4894d63ea050f921cda939ab650c68b952b87c6941a11593b320b2f95d278d5b"
  else
    url "https://github.com/mishamyrt/bose-nc/releases/download/v0.2.2/bose-nc-x86_64-apple-darwin.tar.xz"
    sha256 "b4ecf105a359985a64df094d1d1c51ddb303f35b32dab86122e082a45e568cec"
  end

  def install
    bin.install "bose-nc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bose-nc version")
  end
end
