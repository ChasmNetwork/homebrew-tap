class ChasmCli < Formula
  desc "Chasm CLI"
  homepage "https://github.com/ChasmNetwork/chasm-cli"
  version "0.0.1"
  license "MIT"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/ChasmNetwork/chasm-cli/releases/download/v#{version}/chasm-cli-darwin-x64-v#{version}.tar.gz"
    sha256 :no_check
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ChasmNetwork/chasm-cli/releases/download/v#{version}/chasm-cli-darwin-arm64-v#{version}.tar.gz"
    sha256 :no_check
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/ChasmNetwork/chasm-cli/releases/download/v#{version}/chasm-cli-linux-x64-v#{version}.tar.gz"
    sha256 :no_check
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ChasmNetwork/chasm-cli/releases/download/v#{version}/chasm-cli-linux-arm64-v#{version}.tar.gz"
    sha256 :no_check
  end

 def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "cli-macos-arm64" => "chasm-cli"
    elsif OS.mac? && Hardware::CPU.intel?
      bin.install "cli-macos-x64" => "chasm-cli"
    elsif OS.linux? && Hardware::CPU.intel?
      bin.install "cli-linux-x64" => "chasm-cli"
    elsif OS.linux? && Hardware::CPU.arm?
      bin.install "cli-linux-arm64" => "chasm-cli"
    end
  end

  test do
    system "#{bin}/chasm-cli", "--version"
  end
end
