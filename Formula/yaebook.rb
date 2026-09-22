class Yaebook < Formula
  desc "Yandex Books EPUB downloader"
  homepage "https://github.com/mishamyrt/yaebook"
  version "0.0.2"
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/mishamyrt/yaebook/releases/download/v0.0.2/yaebook-aarch64-apple-darwin.tar.xz"
    sha256 "129bf947e0b13da7a62a098488362d47e72bcfed4bc5e281042320d306194a64"
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/mishamyrt/yaebook/releases/download/v0.0.2/yaebook-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "5f97e2d9713141fe0cad267d3e1953dde597dca7d6aedb912e0b4537cc5867e9"
    end
    if Hardware::CPU.intel?
      url "https://github.com/mishamyrt/yaebook/releases/download/v0.0.2/yaebook-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "0860825a2e6a650564f65a6c2a647219a2a507bee67fd887c31935010f6f0be3"
    end
  end
  license "MIT"

  BINARY_ALIASES = {
    "aarch64-apple-darwin":      {},
    "aarch64-unknown-linux-gnu": {},
    "x86_64-pc-windows-gnu":     {},
    "x86_64-unknown-linux-gnu":  {},
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
      bin.install "yaebook"
    end
    if OS.linux? && Hardware::CPU.arm?
      bin.install "yaebook"
    end
    if OS.linux? && Hardware::CPU.intel?
      bin.install "yaebook"
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
