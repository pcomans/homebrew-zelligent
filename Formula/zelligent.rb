class Zelligent < Formula
  desc "Spawn AI coding agents in Zellij worktree tabs"
  homepage "https://github.com/pcomans/zelligent"
  version "0.1.11"
  url "https://github.com/pcomans/zelligent/releases/download/v#{version}/zelligent-v#{version}.tar.gz"
  sha256 "e519474b2cee49ef5be1da32bbd15f343ca54548d018f153425861866cdf61e9"
  license "MIT"

  depends_on "zellij"
  depends_on "lazygit"

  def install
    bin.install "zelligent.sh" => "zelligent"
    (share/"zelligent").install "zelligent-plugin.wasm"
  end

  def caveats
    <<~EOS
      Run `zelligent doctor` to install the Zellij plugin and configure keybindings.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/zelligent --version")
  end
end
