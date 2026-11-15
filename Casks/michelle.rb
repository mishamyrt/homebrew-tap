cask "michelle" do
  version "0.2.0"
  sha256 "3dfc4e2e1c8bcf632e83c570c71b8643869d2f674d04edf347f53661cd4bc02a"

  url "https://github.com/mishamyrt/michelle/releases/download/v0.2.0/Michelle-0.2.0.dmg"
  name "Michelle"
  desc "Native macOS client for local coding agents"
  homepage "https://github.com/mishamyrt/michelle"

  depends_on arch: :arm64
  depends_on macos: ">= :ventura"

  app "Michelle.app"
end
