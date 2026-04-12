class Repomop < Formula
  desc "Project artifacts cleaner"
  homepage "https://github.com/mishamyrt/repomop"
  version "0.7.1"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/mishamyrt/repomop/releases/download/v0.7.1/repomop_darwin_arm64.tar.gz"
    sha256 "1f8b0ad17210fad13f164a63e9a1a25a9df71525cf542450e5b46d216c540613"
  else
    url "https://github.com/mishamyrt/repomop/releases/download/v0.7.1/repomop_darwin_amd64.tar.gz"
    sha256 "fedd84a6241669f27555f9489b0f7bcb46cee0d4eaf9b6476144304c56985994"
  end

  def install
    bin.install "repomop"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/repomop --version")
  end
end
