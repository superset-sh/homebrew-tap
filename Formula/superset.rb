class Superset < Formula
  desc "CLI and host-service for Superset"
  homepage "https://superset.sh"
  version "0.2.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/superset-sh/superset/releases/download/cli-v#{version}/superset-darwin-arm64.tar.gz"
      sha256 "e482dbf80eb7de13cf82d5a1f066c5e049fc8315d94e4875030aa3a1a075a978"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/superset-sh/superset/releases/download/cli-v#{version}/superset-linux-x64.tar.gz"
      sha256 "93f40a699da28d3cc1843930303440b207177c26bc57cbc84ca702629e233cdf"
    end
    on_arm do
      url "https://github.com/superset-sh/superset/releases/download/cli-v#{version}/superset-linux-arm64.tar.gz"
      sha256 "95585c6d10f689e313ee276b07f7d02c9f928dbea23239b88dcb3f4482331c69"
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
