class Runon < Formula
  desc "Run commands on macOS system events"
  homepage "https://github.com/mishamyrt/runon"
  version "0.3.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/mishamyrt/runon/releases/download/v0.3.0/runon-aarch64-apple-darwin.tar.xz"
      sha256 "1b4d7b62e8893e1fb2c832d5b2c60ff03ef34f7bd28501903488b3f827fe7341"
    end
    if Hardware::CPU.intel?
      url "https://github.com/mishamyrt/runon/releases/download/v0.3.0/runon-x86_64-apple-darwin.tar.xz"
      sha256 "118a4210d35e5809329cbeb1e26f608cef256eb880b9e5966448b899f5545c0f"
    end
  end
  license "MIT"

  depends_on macos: :sequoia

  BINARY_ALIASES = {
    "aarch64-apple-darwin": {},
    "x86_64-apple-darwin":  {},
  }.freeze

  def target_triple
    cpu = Hardware::CPU.arm? ? "aarch64" : "x86_64"
    os = OS.mac? ? "apple-darwin" : "unknown-linux-gnu"

    "#{cpu}-#{os}"
  end

  def install_binary_aliases!
    BINARY_ALIASES[target_triple.to_sym].each do |source, dests|
      dests.each do |dest|
        bin.install_symlink bin/source.to_s => dest
      end
    end
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "runon"
    end
    if OS.mac? && Hardware::CPU.intel?
      bin.install "runon"
    end

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end

  service do
    run opt_bin/"runon"
    keep_alive successful_exit: false
    stop_timeout 5
    environment_variables HOME: Dir.home
    error_log_path var/"log/runon.log"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/runon --version")
  end
end
