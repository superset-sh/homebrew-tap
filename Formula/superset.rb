class Superset < Formula
  desc "CLI and host-service for Superset"
  homepage "https://superset.sh"
  version "1.23.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/superset-sh/superset/releases/download/cli-v#{version}/superset-darwin-arm64.tar.gz"
      sha256 "21130261e5560732bd02478a36d60485255c9c616c143926df5729d15a060aa1"
    end
    on_intel do
      url "https://github.com/superset-sh/superset/releases/download/cli-v#{version}/superset-darwin-x64.tar.gz"
      sha256 "f7701b87832a6c11f5297e8568e87d3bfa3a6a786139fa745a6fda6120613425"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/superset-sh/superset/releases/download/cli-v#{version}/superset-linux-x64.tar.gz"
      sha256 "1b8b51a6fe290a5a2b19722a7b6d4b487347ad64a1b667ff1a70735aa61bfb9e"
    end
    on_arm do
      url "https://github.com/superset-sh/superset/releases/download/cli-v#{version}/superset-linux-arm64.tar.gz"
      sha256 "21d29e21e00145d8028d47f83621f4d6bcf680b86dd5eb8e34637eba051b2b3c"
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
