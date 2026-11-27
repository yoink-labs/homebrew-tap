class Split < Formula
  desc "Manage shared expenses and connect MCP clients to Split by Yoink Labs"
  homepage "https://github.com/yoink-labs/homebrew-tap"
  url "https://github.com/yoink-labs/homebrew-tap/releases/download/split-v0.3.0/split-0.3.0.tar.gz"
  sha256 "e0a498ec94f4d9a9d8f6b5d06c508aaf8eae52686a5acee25b8a574759a83198"

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
    assert_equal "split 0.3.0", shell_output("#{bin}/split --version").strip
    assert_match "Usage: split", shell_output("#{bin}/split --help")
  end
end
