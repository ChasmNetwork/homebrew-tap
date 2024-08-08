class ChasmCli < Formula
  desc "Chasm CLI"
  homepage "https://github.com/ChasmNetwork/chasm-cli"
  version "0.0.1"
  license "MIT"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/ChasmNetwork/chasm-cli/releases/download/v#{version}/chasm-cli-darwin-x64-v#{version}.tar.gz"
    sha256 "7085de246686ea0081f9fe26a5be4af716eb48c333b562345f91dbd17dcd3bb4"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ChasmNetwork/chasm-cli/releases/download/v#{version}/chasm-cli-darwin-arm64-v#{version}.tar.gz"
    sha256 "9dd728573d3639ebdfa131e0f3325e184416b42ec9d621fff0299ad8b892c1a7"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/ChasmNetwork/chasm-cli/releases/download/v#{version}/chasm-cli-linux-x64-v#{version}.tar.gz"
    sha256 "f9a7a546b1085520b7fc7ad8494b346a56c16132254d813f84f21cfc91f4f1e5"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ChasmNetwork/chasm-cli/releases/download/v#{version}/chasm-cli-linux-arm64-v#{version}.tar.gz"
    sha256 "407c4ce9aaf418598584bf22bd8a574a9977fb1330dd309bb2bb765a2bf74587"
  end

 def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "cli-macos-arm64" => "chasm"
    elsif OS.mac? && Hardware::CPU.intel?
      bin.install "cli-macos-x64" => "chasm"
    elsif OS.linux? && Hardware::CPU.intel?
      bin.install "cli-linux-x64" => "chasm"
    elsif OS.linux? && Hardware::CPU.arm?
      bin.install "cli-linux-arm64" => "chasm"
    end
  end

  test do
    system "#{bin}/chasm", "--version"
  end
end
