class Zelligent < Formula
  desc "Spawn AI coding agents in Zellij worktree tabs"
  homepage "https://github.com/pcomans/zelligent"
  version "0.1.14"
  url "https://github.com/pcomans/zelligent/releases/download/v#{version}/zelligent-v#{version}.tar.gz"
  sha256 "336a98a07c89f3965606069ca4b8eb121baef39954a5f560d36c709f344540bf"
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
