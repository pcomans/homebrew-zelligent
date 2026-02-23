class Zelligent < Formula
  desc "Spawn AI coding agents in Zellij worktree tabs"
  homepage "https://github.com/pcomans/zelligent"
  url "https://github.com/pcomans/zelligent/releases/download/v#{version}/zelligent-v#{version}.tar.gz"
  sha256 ""
  license "MIT"
  version "0.1.0"

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
