class Zelligent < Formula
  desc "Spawn AI coding agents in Zellij worktree tabs"
  homepage "https://github.com/pcomans/zelligent"
  version "0.2.3"
  url "https://github.com/pcomans/zelligent/releases/download/v#{version}/zelligent-v#{version}.tar.gz"
  sha256 "22ea8b0e8b316ad8500cc32acbf87e60ca226157c8b09744d2a3b2b3838a84e3"
  license "MIT"

  depends_on "zellij"
  depends_on "lazygit"

  def install
    bin.install "zelligent.sh" => "zelligent"
    (share/"zelligent").install "zelligent-plugin.wasm"
    (share/"zelligent").install "default-layout.kdl"
  end

  def caveats
    <<~EOS
      Run `zelligent doctor` to install the default layout and plugin permissions.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/zelligent --version")
  end
end
