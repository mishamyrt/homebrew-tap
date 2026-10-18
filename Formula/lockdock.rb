class Lockdock < Formula
  desc "macOS Dock position fixer"
  homepage "https://github.com/mishamyrt/lockdock"
  version "0.5.1"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/mishamyrt/lockdock/releases/download/v0.5.1/lockdock_v0.5.1_darwin_arm64.tar.gz"
    sha256 "6b97c27adcdb7cb0ab29a0c2d71ca255e02259253d4ed2c6da23c4d0844d9fd6"
  else
    url "https://github.com/mishamyrt/lockdock/releases/download/v0.5.1/lockdock_v0.5.1_darwin_amd64.tar.gz"
    sha256 "3e5bcb22ba62c51025226e3c37072bd71924f1808530edb970e8022e4666bf21"
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
