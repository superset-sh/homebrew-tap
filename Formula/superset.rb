class Superset < Formula
  desc "CLI and host-service for Superset"
  homepage "https://superset.sh"
  version "1.25.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/superset-sh/superset/releases/download/cli-v#{version}/superset-darwin-arm64.tar.gz"
      sha256 "a974afce43df837c942ea78e64a9bd0a033cd87b17a52a063aabcbfaaa68ab95"
    end
    on_intel do
      url "https://github.com/superset-sh/superset/releases/download/cli-v#{version}/superset-darwin-x64.tar.gz"
      sha256 "941ca02d42f9a6957db1708a9ea6a5483484a3247a9958c925fb568075ca713d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/superset-sh/superset/releases/download/cli-v#{version}/superset-linux-x64.tar.gz"
      sha256 "3a823684624856aaac082377a727c5cd192bd369094690b67cd357feb1438ab3"
    end
    on_arm do
      url "https://github.com/superset-sh/superset/releases/download/cli-v#{version}/superset-linux-arm64.tar.gz"
      sha256 "86185a8a1568ebcd5f94d2fa597c42bcc1659ee3eb65e20129cc73ce7ab85d32"
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
