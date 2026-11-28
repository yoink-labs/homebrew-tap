class Split < Formula
  desc "Manage shared expenses and connect MCP clients to Split by Yoink Labs"
  homepage "https://github.com/yoink-labs/homebrew-tap"
  url "https://github.com/yoink-labs/homebrew-tap/releases/download/split-v0.3.5/split-0.3.5.tar.gz"
  sha256 "2d58f1fe7ba12d3f44f1b7c16ab1e1f516b35649b2f82ab53bdfc6c6098ba789"

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
    assert_equal "split 0.3.5", shell_output("#{bin}/split --version").strip
    assert_match "Usage: split", shell_output("#{bin}/split --help")
  end
end
