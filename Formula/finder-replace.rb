class FinderReplace < Formula
  desc "Open a configured application when clicking Finder in the Dock"
  homepage "https://github.com/mishamyrt/finder-replace"
  version "0.1.2"

  depends_on macos: :ventura

  on_arm do
    url "https://github.com/mishamyrt/finder-replace/releases/download/v0.1.2/finder-replace_v0.1.2_darwin_arm64.tar.gz"
    sha256 "b1a82072253d00e8c2bf814fc36fe15f1c7420cf639bee9aead9b1416bf33cc1"
  end

  on_intel do
    url "https://github.com/mishamyrt/finder-replace/releases/download/v0.1.2/finder-replace_v0.1.2_darwin_x86_64.tar.gz"
    sha256 "8f83fb0f5c413c715ed5d3d2101a31dd5cafbbb83d3740b8d97d824c4abc75e7"
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
