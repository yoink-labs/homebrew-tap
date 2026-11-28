class Split < Formula
  desc "Manage shared expenses and connect MCP clients to Split by Yoink Labs"
  homepage "https://github.com/yoink-labs/homebrew-tap"
  url "https://github.com/yoink-labs/homebrew-tap/releases/download/split-v0.3.6/split-0.3.6.tar.gz"
  sha256 "474dc9357d617f29f94d8fb0797815c27ef8c06a9ef7bc08d7e3cf5e95e48c37"

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
    assert_equal "split 0.3.6", shell_output("#{bin}/split --version").strip
    assert_match "Usage: split", shell_output("#{bin}/split --help")
  end
end
