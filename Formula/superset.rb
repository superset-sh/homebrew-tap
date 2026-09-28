class Superset < Formula
  desc "CLI and host-service for Superset"
  homepage "https://superset.sh"
  version "1.31.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/superset-sh/superset/releases/download/cli-v#{version}/superset-darwin-arm64.tar.gz"
      sha256 "0584014dd0fea1108a2b6fa59e2bbc05105bc228945fc48f6667ca5b14967e6a"
    end
    on_intel do
      url "https://github.com/superset-sh/superset/releases/download/cli-v#{version}/superset-darwin-x64.tar.gz"
      sha256 "c3adbe4f62e0c8f97299104c29c3486a67f5b780b09edb4fba45fa5ec8e9bb01"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/superset-sh/superset/releases/download/cli-v#{version}/superset-linux-x64.tar.gz"
      sha256 "6d3596460af651bb088ea41623e8c6d825a2b30f2db9c5c8e07d44fe9da531a6"
    end
    on_arm do
      url "https://github.com/superset-sh/superset/releases/download/cli-v#{version}/superset-linux-arm64.tar.gz"
      sha256 "23f28b00eefecaafa2010c6f1d2422dd1454812ced37c238ef71bcd4d785dac7"
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
