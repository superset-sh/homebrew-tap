class Superset < Formula
  desc "CLI and host-service for Superset"
  homepage "https://superset.sh"
  version "1.18.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/superset-sh/superset/releases/download/cli-v#{version}/superset-darwin-arm64.tar.gz"
      sha256 "8d8719de88805543e6a57d6bb1a86877598385894f1d5153d59efcccb60a846f"
    end
    on_intel do
      url "https://github.com/superset-sh/superset/releases/download/cli-v#{version}/superset-darwin-x64.tar.gz"
      sha256 "7fd101d67638025b7f2c26e9371fc58583f85047a39a614a02c98f7099d55c08"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/superset-sh/superset/releases/download/cli-v#{version}/superset-linux-x64.tar.gz"
      sha256 "9eb3a5f8e368d95316bae6062b9c68d189c0351172cb80759aec2b471f5c3f63"
    end
    on_arm do
      url "https://github.com/superset-sh/superset/releases/download/cli-v#{version}/superset-linux-arm64.tar.gz"
      sha256 "7cd564999130f75d3f1ce7ad4ca02a45a4598b66f6082f5ae635e6588c7880da"
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
