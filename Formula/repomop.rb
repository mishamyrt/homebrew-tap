class Repomop < Formula
  desc "Project artifacts cleaner"
  homepage "https://github.com/mishamyrt/repomop"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/mishamyrt/repomop/releases/download/v0.6.1/repomop_darwin_arm64.tar.gz"
    sha256 "20083dd6532c41634917b64bd1e2ec763730507984a2d9d10f5a92e82797b8a9"
  else
    url "https://github.com/mishamyrt/repomop/releases/download/v0.6.1/repomop_darwin_amd64.tar.gz"
    sha256 "fa6e3d74c20e1dcc52e1de1bb45b31f51e4f822ee6c9b896f526814e6ab95fca"
  end

  def install
    bin.install "repomop"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/repomop --version")
  end
end
