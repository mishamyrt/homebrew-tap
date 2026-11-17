class Icnsane < Formula
  desc "Apply custom macOS application icons from a TOML file"
  homepage "https://github.com/mishamyrt/icnsane"
  version "0.1.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/mishamyrt/icnsane/releases/download/v0.1.0/icnsane-aarch64-apple-darwin.tar.xz"
      sha256 "e0e0adc8be119539b5c4ad9fec64b7c0393524e802974a831b79e3cf75eb8065"
    end
    if Hardware::CPU.intel?
      url "https://github.com/mishamyrt/icnsane/releases/download/v0.1.0/icnsane-x86_64-apple-darwin.tar.xz"
      sha256 "850f40c907d88e711573da2c4d9c8d18a8cb21130d4a17ccbd13231c59f0df9a"
    end
  end

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
      bin.install "icnsane"
    end
    if OS.mac? && Hardware::CPU.intel?
      bin.install "icnsane"
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
