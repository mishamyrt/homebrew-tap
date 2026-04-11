class Repomop < Formula
  desc "Project artifacts cleaner"
  homepage "https://github.com/mishamyrt/repomop"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/mishamyrt/repomop/releases/download/v0.7.0/repomop_darwin_arm64.tar.gz"
    sha256 "a657bc09d371a95a50f86e4aad00af0dabe7619a8f8ff331d4a37ae9b6ecf74d"
  else
    url "https://github.com/mishamyrt/repomop/releases/download/v0.7.0/repomop_darwin_amd64.tar.gz"
    sha256 "ec552503f57bce0a5cd4f47dd9f47d1c723172f2ee0da223a7c65c618947f3f8"
  end

  def install
    bin.install "repomop"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/repomop --version")
  end
end
