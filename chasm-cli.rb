class ChasmCli < Formula
  desc "Chasm CLI"
  homepage "https://github.com/ChasmNetwork/chasm-cli"
  version "0.0.1"
  license "MIT"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/ChasmNetwork/chasm-cli/releases/download/v#{version}/chasm-cli-darwin-x64-v#{version}.tar.gz"
    sha256 "9b660099bbd4c1e54ee0acf3cf2dd8df1f6558fdd0e58cf1f8c8f9345a78f1f0"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ChasmNetwork/chasm-cli/releases/download/v#{version}/chasm-cli-darwin-arm64-v#{version}.tar.gz"
    sha256 "90e588ecc7ad414dbd323c6ca37e89bd0eef4b0f700eb795f367f4a0ba982d59"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/ChasmNetwork/chasm-cli/releases/download/v#{version}/chasm-cli-linux-x64-v#{version}.tar.gz"
    sha256 "080a5aa947d6057bf1c9ac362b84382b02ced28e8d034de08e35cc5e5ca9789e"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ChasmNetwork/chasm-cli/releases/download/v#{version}/chasm-cli-linux-arm64-v#{version}.tar.gz"
    sha256 "187c28458e694017213b1fad470de5ab5a1eb35a60bb514b99ee418395a46d83"
  end

  def install
    bin.install "chasm-cli"
  end

  test do
    system "#{bin}/chasm-cli", "--version"
  end
end
