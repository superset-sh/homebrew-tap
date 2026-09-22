class Superset < Formula
  desc "CLI and host-service for Superset"
  homepage "https://superset.sh"
  version "1.30.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/superset-sh/superset/releases/download/cli-v#{version}/superset-darwin-arm64.tar.gz"
      sha256 "0c22e12fc4d1775e1219344bfbf91dbb9deb56d6e6c48ae942ebaa5b00608482"
    end
    on_intel do
      url "https://github.com/superset-sh/superset/releases/download/cli-v#{version}/superset-darwin-x64.tar.gz"
      sha256 "9fc2a53f5ab10cc0f2f2f9b9f54f1a25296dedb1f1d5290498c6adf9921e4517"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/superset-sh/superset/releases/download/cli-v#{version}/superset-linux-x64.tar.gz"
      sha256 "d546bbac7930c3bf17a546435fcc972f04e7c12e9ceed832e29a70e97c510e68"
    end
    on_arm do
      url "https://github.com/superset-sh/superset/releases/download/cli-v#{version}/superset-linux-arm64.tar.gz"
      sha256 "89c5845dce6d871cc23aba18737c49ae3ad327aa8345e8f17eef4e2713588df2"
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
