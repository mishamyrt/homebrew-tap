class Lidoff < Formula
  desc "Third state for the MacBook lid"
  homepage "https://github.com/mishamyrt/lidoff"
  version "0.6.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/mishamyrt/lidoff/releases/download/v0.6.0/lidoff-aarch64-apple-darwin.tar.xz"
      sha256 "44406388a8b3d3223840fdac71f953f3d2cb84c13d2ed2d7b7007442ba0de6f0"
    end
    if Hardware::CPU.intel?
      url "https://github.com/mishamyrt/lidoff/releases/download/v0.6.0/lidoff-x86_64-apple-darwin.tar.xz"
      sha256 "35b65fb467d2087750ede9b0e2a974bb26e0b8e66d1c481443591170be1a26f1"
    end
  end
  license "MIT"

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
      bin.install "lidoff"
    end
    if OS.mac? && Hardware::CPU.intel?
      bin.install "lidoff"
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
    run opt_bin/"lidoff"
    keep_alive true
    log_path var/"log/lidoff.log"
    error_log_path var/"log/lidoff.log"
  end
end
