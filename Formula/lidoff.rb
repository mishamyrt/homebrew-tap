class Lidoff < Formula
  desc "Third state for the MacBook lid"
  homepage "https://github.com/mishamyrt/lidoff"
  version "0.5.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/mishamyrt/lidoff/releases/download/v0.5.0/lidoff-aarch64-apple-darwin.tar.xz"
      sha256 "f42a737caf9b59de7c98fb4fc88daccfa064fe5903b220562043b09dd3de516d"
    end
    if Hardware::CPU.intel?
      url "https://github.com/mishamyrt/lidoff/releases/download/v0.5.0/lidoff-x86_64-apple-darwin.tar.xz"
      sha256 "4b8c2e90e6a071889c67c62f7a0a2f69b14a0d72939976134cefd4b98067b986"
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
    bin.install "lidoff" if OS.mac? && Hardware::CPU.arm?
    bin.install "lidoff" if OS.mac? && Hardware::CPU.intel?

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
