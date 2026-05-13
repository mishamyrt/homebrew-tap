class Lockdock < Formula
  desc "macOS Dock position fixer"
  homepage "https://github.com/mishamyrt/lockdock"
  version "0.4.1"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/mishamyrt/lockdock/releases/download/v0.4.1/lockdock_v0.4.1_darwin_arm64.tar.gz"
    sha256 "c47738dee18a1d89ead95a3aa28108b1a111ce75d9fd8e9cb03c23487c74483a"
  else
    url "https://github.com/mishamyrt/lockdock/releases/download/v0.4.1/lockdock_v0.4.1_darwin_amd64.tar.gz"
    sha256 "963b42a64506298a6af1e00764be30c0fb991dd2dfc4877daa5c134495f471c8"
  end

  def install
    bin.install "lockdock"
  end

  service do
    run [opt_bin/"lockdock", "run"]
    keep_alive true
    process_type :interactive
    log_path "/dev/null"
    error_log_path "/dev/null"
  end

  def caveats
    <<~EOS
      Use  or  to launch Lockdock at login.

      Stop the service before uninstalling:
        brew services stop lockdock
      If the formula was already removed, run:
        brew services cleanup
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/lockdock version")
  end
end
