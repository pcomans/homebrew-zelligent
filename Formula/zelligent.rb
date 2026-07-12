class Zelligent < Formula
  desc "Spawn AI coding agents in Zellij worktree tabs"
  homepage "https://github.com/pcomans/zelligent"
  version "0.2.7"
  url "https://github.com/pcomans/zelligent/releases/download/v#{version}/zelligent-v#{version}.tar.gz"
  sha256 "acf7980cfbf6ab3c1753d3e381ab9f8afb3ca2eb1020dc9a4ad5a8a7616629f0"
  license "MIT"

  depends_on "zellij"
  depends_on "lazygit"

  def install
    bin.install "zelligent.sh" => "zelligent"
    (share/"zelligent").install "zelligent-plugin.wasm"
    (share/"zelligent").install "default-layout.kdl"
    (share/"zelligent").install "claude-plugin"
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
