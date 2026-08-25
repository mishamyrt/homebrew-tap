class Lockdock < Formula
  desc "macOS Dock position fixer"
  homepage "https://github.com/mishamyrt/lockdock"
  version "0.5.0"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/mishamyrt/lockdock/releases/download/v0.5.0/lockdock_v0.5.0_darwin_arm64.tar.gz"
    sha256 "dcb629a3bf77911761e3c0e93f4d91cf57cb7015c9e832a82adba396825cc00f"
  else
    url "https://github.com/mishamyrt/lockdock/releases/download/v0.5.0/lockdock_v0.5.0_darwin_amd64.tar.gz"
    sha256 "39c154e438b5a10a111e5981129328786dc377090d6c4e316a7ad39149acac70"
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
