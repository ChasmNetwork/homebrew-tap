class ChasmCli < Formula
  desc "Chasm CLI"
  homepage "https://github.com/ChasmNetwork/chasm-cli"
  version "0.0.1"
  license "MIT"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/ChasmNetwork/chasm-cli/releases/download/v#{version}/chasm-cli-darwin-x64-v#{version}.tar.gz"
    sha256 "aa6adc6d4d8878df5da8ae321588df3718b881a5cb65ca26e090b1cca6cc6a6b"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ChasmNetwork/chasm-cli/releases/download/v#{version}/chasm-cli-darwin-arm64-v#{version}.tar.gz"
    sha256 "db20583455c97f28c7953b2b5f194c6311c17d56cf7597b12415dd033a3b47a2"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/ChasmNetwork/chasm-cli/releases/download/v#{version}/chasm-cli-linux-x64-v#{version}.tar.gz"
    sha256 "24c4351ae8ef4a049fa5a99ef483b7dbef9df22fcb9b44cc0aaed57824fae2f3"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ChasmNetwork/chasm-cli/releases/download/v#{version}/chasm-cli-linux-arm64-v#{version}.tar.gz"
    sha256 "38098c5879ccd7ae70cc34fb664279ba4b814edb48d32ed2bca4b5d06d685383"
  end

  def install
    bin.install "chasm-cli"
  end

  test do
    system "#{bin}/chasm-cli", "--version"
  end
end
