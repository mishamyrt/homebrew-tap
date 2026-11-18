class Nanomiddleclick < Formula
  desc "Lightweight daemon for middle-click emulation"
  homepage "https://github.com/mishamyrt/nanomiddleclick"
  version "0.2.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/mishamyrt/nanomiddleclick/releases/download/v0.2.0/nanomiddleclick-aarch64-apple-darwin.tar.xz"
      sha256 "3f7977503487710f658319d826e8fb43cdc4c1dc75a7d8ef7f1422d686fc4b97"
    end
    if Hardware::CPU.intel?
      url "https://github.com/mishamyrt/nanomiddleclick/releases/download/v0.2.0/nanomiddleclick-x86_64-apple-darwin.tar.xz"
      sha256 "fb5091815a065bcfb77d1e5f50fe7e77fb469c4542f2c190e8bb533bd6b348e1"
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
      bin.install "nanomiddleclick"
    end
    if OS.mac? && Hardware::CPU.intel?
      bin.install "nanomiddleclick"
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
    run opt_bin/"nanomiddleclick"
    keep_alive crashed: true
    error_log_path var/"log/nanomiddleclick.log"
  end
end
