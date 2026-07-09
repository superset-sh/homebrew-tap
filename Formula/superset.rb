class Superset < Formula
  desc "CLI and host-service for Superset"
  homepage "https://superset.sh"
  version "0.2.24"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/superset-sh/superset/releases/download/cli-v#{version}/superset-darwin-arm64.tar.gz"
      sha256 "188937223642e50596c1d03bd0d93fbd46a54424567a1a39ce6a244e777d5fdf"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/superset-sh/superset/releases/download/cli-v#{version}/superset-linux-x64.tar.gz"
      sha256 "c3c588edced9dda2b19ba5afd358cafec88149ebffec1b518de09f5234737165"
    end
    on_arm do
      url "https://github.com/superset-sh/superset/releases/download/cli-v#{version}/superset-linux-arm64.tar.gz"
      sha256 "d966a1589b1673bc4734245d6c892708eb51d7f71e31ab929543bdf06e9ac70c"
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
