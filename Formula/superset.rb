class Superset < Formula
  desc "CLI and host-service for Superset"
  homepage "https://superset.sh"
  version "1.14.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/superset-sh/superset/releases/download/cli-v#{version}/superset-darwin-arm64.tar.gz"
      sha256 "3ab955025f06f4ac3155ede35d1b5b8988acc1037a8b7cff6da98be7eebebac6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/superset-sh/superset/releases/download/cli-v#{version}/superset-linux-x64.tar.gz"
      sha256 "f17743fde77832a7bca94a92809638bf70586cacd5227234640bebabcba1feb9"
    end
    on_arm do
      url "https://github.com/superset-sh/superset/releases/download/cli-v#{version}/superset-linux-arm64.tar.gz"
      sha256 "4596c08457fe5b39f9e827fa339a59a6f4543c80f40d88d1b81ddc43968bf7fc"
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
