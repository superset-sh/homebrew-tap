class Superset < Formula
  desc "CLI and host-service for Superset"
  homepage "https://superset.sh"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/superset-sh/superset/releases/download/cli-v#{version}/superset-darwin-arm64.tar.gz"
      sha256 "36a4791af822a18b901ebbe5a98b83123ef3378fbfb8d3dd1c00a11deb400dbc"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/superset-sh/superset/releases/download/cli-v#{version}/superset-linux-x64.tar.gz"
      sha256 "6c248e08648aa8e96f08b25f7b6de7ab3d6da2bc9856b347ff2c76b88b2190e2"
    end
    on_arm do
      url "https://github.com/superset-sh/superset/releases/download/cli-v#{version}/superset-linux-arm64.tar.gz"
      sha256 "b8bc2522ac22c7ccd050c2addb9cad8198512a8e06b08b9171a22c55edd2976b"
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
