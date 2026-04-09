class Superset < Formula
  desc "CLI and host-service for Superset"
  homepage "https://superset.sh"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/superset-sh/superset/releases/download/cli-v#{version}/superset-darwin-arm64.tar.gz"
      sha256 "1241cbbcefe938f156d5620cdb4070935ce702f2c2d50043c9adffaac059551c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/superset-sh/superset/releases/download/cli-v#{version}/superset-linux-x64.tar.gz"
      sha256 "6f26c192d8c2eaabdea361a44f9c7284486f86bead11738e20667d823ab83afa"
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
