class Zelligent < Formula
  desc "Spawn AI coding agents in Zellij worktree tabs"
  homepage "https://github.com/pcomans/zelligent"
  version "0.2.4"
  url "https://github.com/pcomans/zelligent/releases/download/v#{version}/zelligent-v#{version}.tar.gz"
  sha256 "1a62b13d1bb3eefc5df9ffec14e726a58f6b13e49a282304d5170cf60402122c"
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
