class Superset < Formula
  desc "CLI and host-service for Superset"
  homepage "https://superset.sh"
  version "1.17.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/superset-sh/superset/releases/download/cli-v#{version}/superset-darwin-arm64.tar.gz"
      sha256 "45943e0b33578b49695604380949e629f261a292388e52a5a4132d9cec89a6df"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/superset-sh/superset/releases/download/cli-v#{version}/superset-linux-x64.tar.gz"
      sha256 "917475f8088aaf489e0c136bef208daf692c696717222ffc051b38e42da495dd"
    end
    on_arm do
      url "https://github.com/superset-sh/superset/releases/download/cli-v#{version}/superset-linux-arm64.tar.gz"
      sha256 "990d3d24e6b7cf47b4e13f81dfbc580032086340cc6a60524e0c67ad52fab5a6"
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
