class FinderReplace < Formula
  desc "Open a configured application when clicking Finder in the Dock"
  homepage "https://github.com/mishamyrt/finder-replace"
  version "0.1.1"

  depends_on macos: :ventura

  on_arm do
    url "https://github.com/mishamyrt/finder-replace/releases/download/v0.1.1/finder-replace_v0.1.1_darwin_arm64.tar.gz"
    sha256 "1a7f74000cceaf94d42e6e957713531f453931705fce7a5ec91d8e4ee73271fc"
  end

  on_intel do
    url "https://github.com/mishamyrt/finder-replace/releases/download/v0.1.1/finder-replace_v0.1.1_darwin_x86_64.tar.gz"
    sha256 "392e843d1ec9952f6771bad71df6ccf047fbb47ea52c601ddb5542ab7d9cfc60"
  end

  def install
    bin.install "finder-replace"
  end

  service do
    run [opt_bin/"finder-replace"]
    keep_alive crashed: true
    process_type :interactive
    log_path var/"log/finder-replace.log"
    error_log_path var/"log/finder-replace.log"
  end

  def caveats
    <<~EOS
      No clicks are intercepted until ApplicationPath is configured, for example:
        defaults write co.myrt.finder-replace ApplicationPath -string "/Applications/Bloom.app"
      Start at login with `brew services start finder-replace` (without sudo).
      After changing settings or granting Accessibility access, run:
        brew services restart finder-replace
      Background execution may need Accessibility permission for the binary itself:
        #{opt_bin}/finder-replace
      Stop with `brew services stop finder-replace` before running a foreground copy.
    EOS
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/finder-replace --version").strip
  end
end
