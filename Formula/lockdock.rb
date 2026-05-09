class Lockdock < Formula
  desc "macOS Dock position fixer"
  homepage "https://github.com/mishamyrt/lockdock"
  version "0.4.0"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/mishamyrt/lockdock/releases/download/v0.4.0/lockdock_v0.4.0_darwin_arm64.tar.gz"
    sha256 "6a39e522704bb29744fd6fa0c08ab8925a9cb99b151299cd17d010f4a888bd5e"
  else
    url "https://github.com/mishamyrt/lockdock/releases/download/v0.4.0/lockdock_v0.4.0_darwin_amd64.tar.gz"
    sha256 "2dff97d20d293693a2fa290c458f6e5348c5808ddfa4afdfacaaf76295732692"
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
