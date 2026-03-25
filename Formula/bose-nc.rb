class BoseNc < Formula
  desc "CLI tool for controlling Bose noise cancelling headphones"
  homepage "https://github.com/mishamyrt/bose-nc"
  version "0.1.2"
  license "MIT"

  on_arm do
    url "https://github.com/mishamyrt/bose-nc/releases/download/v0.1.2/bose-nc-aarch64-apple-darwin.tar.xz"
    sha256 "e03c354521292b4ec2f91db526e103f556beefbe2fc538ba2ec8caa73ec1ef71"
  end

  on_intel do
    url "https://github.com/mishamyrt/bose-nc/releases/download/v0.1.2/bose-nc-x86_64-apple-darwin.tar.xz"
    sha256 "07ec1c1f888d6373c83d3dc27bc0a91424a6f45a76a72c5f32ffdde354e194d2"
  end

  depends_on :macos

  def install
    bin.install "bose-nc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bose-nc --version")
  end
end
