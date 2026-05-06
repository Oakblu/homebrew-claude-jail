class ClaudeJail < Formula
  desc "Run Claude Code in an isolated Docker sandbox"
  homepage "https://github.com/oakblu/claude-jail"
  url "https://github.com/oakblu/claude-jail/archive/refs/tags/v1.0.11.tar.gz"
  sha256 "52b49711645b673848dc1df9fdf359f2d304869337eb05d8ee71052108481c56"
  license "MIT"

  depends_on "bash"

  def install
    bin.install "scripts/claude-jail" => "claude-jail"
  end

  def caveats
    <<~EOS
      claude-jail requires Docker to be installed and running.

      Recommended options:
        • Docker Desktop  https://www.docker.com/products/docker-desktop
        • OrbStack        https://orbstack.dev
        • Colima          brew install colima && colima start

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
