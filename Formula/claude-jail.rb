class ClaudeJail < Formula
  desc "Run Claude Code in an isolated Docker sandbox"
  homepage "https://github.com/oakblu/claude-jail"
  url "https://github.com/oakblu/claude-jail/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "26b4700159eca75471d91589d7f882ecd8ca737cccb1011e4af40db6c534a354"
  license "MIT"

  depends_on "bash"

  def install
    bin.install "scripts/claude-jail" => "claude-jail"
  end

  def post_install
    system "#{bin}/claude-jail", "--install", "--quiet"
  rescue StandardError
    # Non-fatal — caveats cover the manual path
  end

  def caveats
    <<~EOS
      claude-jail requires Docker to be installed and running.

      Recommended options:
        • Docker Desktop  https://www.docker.com/products/docker-desktop
        • OrbStack        https://orbstack.dev
        • Colima          brew install colima && colima start

      Shell setup runs automatically. If it was skipped, run:
        claude-jail --install

      To verify:
        claude-jail --help
    EOS
  end

  test do
    output = shell_output("#{bin}/claude-jail --help")
    assert_match "claude-jail", output
    assert_match "Docker", output
  end
end
