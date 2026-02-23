class Zelligent < Formula
  desc "Spawn AI coding agents in Zellij worktree tabs"
  homepage "https://github.com/pcomans/zelligent"
  version "0.1.10"
  url "https://github.com/pcomans/zelligent/releases/download/v#{version}/zelligent-v#{version}.tar.gz"
  sha256 "ab3a149284572d3c7ec9987c9ba00e3fbfb17738f9bfbbd44ccf9dc88fa4ea89"
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
