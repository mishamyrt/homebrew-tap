class RepoMop < Formula
  desc "Project artifacts cleaner"
  homepage "https://github.com/mishamyrt/repomop"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos

  url "https://github.com/mishamyrt/repomop/releases/download/v0.6.0/repomop_darwin_arm64.tar.gz"
  sha256 "291a67ee89e2e9c062f7967653d6201c35656cf52816af201e3d4d40d8129c7f"

  def install
    bin.install "repomop"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/repomop --version")
  end
end
