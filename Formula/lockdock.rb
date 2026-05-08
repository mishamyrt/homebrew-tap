class Lockdock < Formula
  desc "macOS Dock position fixer"
  homepage "https://github.com/mishamyrt/lockdock"
  version "0.3.0"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/mishamyrt/lockdock/releases/download/v0.3.0/lockdock_v0.3.0_darwin_arm64.tar.gz"
    sha256 "80d4621a8bd2b1227b0df20898e0ccbb1de6b7a70fb6adcd4b30c9d2bb7d3356"
  else
    url "https://github.com/mishamyrt/lockdock/releases/download/v0.3.0/lockdock_v0.3.0_darwin_amd64.tar.gz"
    sha256 "15143019c3db893d46dc04afd79af8dde06aabddab594af01ddae826520e1e8e"
  end

  def install
    bin.install "lockdock"
  end

  def post_install
    pid_path = File.expand_path("~/Library/Caches/co.myrt.lockdock/daemon.pid")
    return unless File.exist?(pid_path)

    pid_text = File.read(pid_path).strip
    return unless pid_text.match?(/\A\d+\z/)

    Process.kill("TERM", pid_text.to_i)
  rescue Errno::ENOENT, Errno::ESRCH
    nil
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/lockdock version")
  end
end
