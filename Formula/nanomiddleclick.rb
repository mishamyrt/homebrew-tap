class Nanomiddleclick < Formula
  desc "Lightweight daemon for middle-click emulation"
  homepage "https://github.com/mishamyrt/nanomiddleclick"
  version "0.1.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/mishamyrt/nanomiddleclick/releases/download/v0.1.0/nanomiddleclick-aarch64-apple-darwin.tar.xz"
      sha256 "3c9376ace0208ed726273f62fa9cb7aac738b5930940d93b3e0dba208344127f"
    end
    if Hardware::CPU.intel?
      url "https://github.com/mishamyrt/nanomiddleclick/releases/download/v0.1.0/nanomiddleclick-x86_64-apple-darwin.tar.xz"
      sha256 "4ce2b225a7a1ce7e2038a180e2bbda906e70065f57e2c72b5ee8a0a710408007"
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
    bin.install "nanomiddleclick" if OS.mac? && Hardware::CPU.arm?
    bin.install "nanomiddleclick" if OS.mac? && Hardware::CPU.intel?

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
