class Lidoff < Formula
  desc "Third state for the MacBook lid"
  homepage "https://github.com/mishamyrt/lidoff"
  version "0.4.3"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/mishamyrt/lidoff/releases/download/v0.4.3/lidoff-aarch64-apple-darwin.tar.xz"
      sha256 "3a7114e2c622fde80e7f5f91ab3a8a4afd1d30f696d473c02ecf085a76fccc2f"
    end
    if Hardware::CPU.intel?
      url "https://github.com/mishamyrt/lidoff/releases/download/v0.4.3/lidoff-x86_64-apple-darwin.tar.xz"
      sha256 "6647db5f8d27d53ba50bc3cf93f65958a53870b966d8e9ff6987f8dc673499a4"
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
