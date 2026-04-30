class Superset < Formula
  desc "CLI and host-service for Superset"
  homepage "https://superset.sh"
  version "0.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/superset-sh/superset/releases/download/cli-v#{version}/superset-darwin-arm64.tar.gz"
      sha256 "42e3470b8339fea2e13eb7d2d6361e5222b557bcf6cb28289c29171ff92db5d3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/superset-sh/superset/releases/download/cli-v#{version}/superset-linux-x64.tar.gz"
      sha256 "af39f9e539bc94d12d1b6c045884b4910bedd147b609fa6907d41bfc91b18418"
    end
    on_arm do
      url "https://github.com/superset-sh/superset/releases/download/cli-v#{version}/superset-linux-arm64.tar.gz"
      sha256 "130432a4f58103f9092e53ca27ae4605425e1c400ac34e0e71a8b49dc0c3f223"
    end
  end

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/superset"
    bin.install_symlink libexec/"bin/superset-host"
  end

  test do
    assert_match "superset", shell_output("#{bin}/superset --version")
  end
end
