class BoseNc < Formula
  desc "CLI tool for controlling Bose noise cancelling headphones"
  homepage "https://github.com/mishamyrt/bose-nc"
  version "0.2.0"
  license "MIT"

  on_arm do
    url "https://github.com/mishamyrt/bose-nc/releases/download/v0.2.0/bose-nc-aarch64-apple-darwin.tar.xz"
    sha256 "bd1f538662f62336049277ae8a13390db1c61326fe832c458def9f14a525afa3"
  end

  on_intel do
    url "https://github.com/mishamyrt/bose-nc/releases/download/v0.2.0/bose-nc-x86_64-apple-darwin.tar.xz"
    sha256 "7386ca16f088682ac113b870d1beaaacd969120f0783fe1f9de3e7b7b3586481"
  end

  depends_on :macos

  def install
    bin.install "bose-nc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bose-nc --version")
  end
end
