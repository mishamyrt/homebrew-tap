class Lockdock < Formula
  desc "macOS Dock position fixer"
  homepage "https://github.com/mishamyrt/lockdock"
  version "0.4.2"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/mishamyrt/lockdock/releases/download/v0.4.2/lockdock_v0.4.2_darwin_arm64.tar.gz"
    sha256 "f6925e7e00a9991a28e00e4827840431c37c2eb5a9df5652fe3c44ac9199426b"
  else
    url "https://github.com/mishamyrt/lockdock/releases/download/v0.4.2/lockdock_v0.4.2_darwin_amd64.tar.gz"
    sha256 "3cf98849cf0b6dce5a377342fb64b64464448bc8de242942e0315ebd38e31f7e"
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
