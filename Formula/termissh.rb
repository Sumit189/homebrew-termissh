class Termissh < Formula
  desc "Terminal manager for your SSH config: search, connect and edit hosts"
  homepage "https://github.com/Sumit189/TermiSSH"
  url "https://github.com/Sumit189/TermiSSH/archive/refs/tags/v1.3.2.tar.gz"
  sha256 "cd6136735b5fa45ffb5466047414001bd7a3329276fc93c5f4f8001b9cde5716"
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
