class Termissh < Formula
  desc "Terminal manager for your SSH config: search, connect and edit hosts"
  homepage "https://github.com/Sumit189/TermiSSH"
  url "https://github.com/Sumit189/TermiSSH/archive/refs/tags/v1.3.1.tar.gz"
  sha256 "ca82973872207da28caf1ce05025b60f00b595594288ef3fd595f0039d2cd430"
  license "PolyForm-Noncommercial-1.0.0"
  head "https://github.com/Sumit189/TermiSSH.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=#{version}")
  end

  test do
    assert_match "termissh #{version}", shell_output("#{bin}/termissh --version")
    assert_match "manager for your ~/.ssh/config", shell_output("#{bin}/termissh --help")

    # TermiSSH must never modify a config it was only asked to read.
    config = testpath/"config"
    original = "# comment\nHost prod\n  HostName 192.0.2.10\n"
    config.write original
    shell_output("#{bin}/termissh --version")
    assert_equal original, config.read
  end
end
