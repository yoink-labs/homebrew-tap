class Split < Formula
  desc "Manage shared expenses and connect MCP clients to Split by Yoink Labs"
  homepage "https://github.com/yoink-labs/homebrew-tap"
  url "https://github.com/yoink-labs/homebrew-tap/releases/download/split-v0.3.12/split-0.3.12.tar.gz"
  sha256 "f188e8d90ad647721833eb67854011bc1be29cabaf4dd71e07a752c69fa377b8"

  depends_on "imagemagick"
  depends_on "node"

  def install
    libexec.install "cli"
    bin.install_symlink libexec/"cli/bin/split"
  end

  def caveats
    <<~EOS
      Run split login, then approve this computer in Split on your iPhone.
      Configure your MCP client to run #{bin}/split mcp.
      macOS's file-splitting utility remains available at /usr/bin/split.
    EOS
  end

  test do
    assert_equal "split 0.3.12", shell_output("#{bin}/split --version").strip
    assert_match "Usage: split", shell_output("#{bin}/split --help")
  end
end
