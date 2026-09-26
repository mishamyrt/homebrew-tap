class Runon < Formula
  desc "Run commands on macOS system events"
  homepage "https://github.com/mishamyrt/runon"
  version "0.2.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/mishamyrt/runon/releases/download/v0.2.0/runon-aarch64-apple-darwin.tar.xz"
      sha256 "f531450a35f5bc4267dd754dc9c5d95b20ead6e67d26df7d4f519d025ed6ef86"
    end
    if Hardware::CPU.intel?
      url "https://github.com/mishamyrt/runon/releases/download/v0.2.0/runon-x86_64-apple-darwin.tar.xz"
      sha256 "790d5441550381b4a228816895133e81d111077c505b36aa1872c42d56d34178"
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
end
