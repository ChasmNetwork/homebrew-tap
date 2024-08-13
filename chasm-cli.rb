class ChasmCli < Formula
  desc "Chasm CLI"
  homepage "https://github.com/ChasmNetwork/chasm-cli"
  version "0.0.1"
  license "MIT"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/ChasmNetwork/chasm-cli/releases/download/v#{version}/chasm-cli-darwin-x64-v#{version}.tar.gz"
    sha256 "059bd8da35857628711259fad407ef098be8fa27f275b04323d0faab4fbf0e49"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ChasmNetwork/chasm-cli/releases/download/v#{version}/chasm-cli-darwin-arm64-v#{version}.tar.gz"
    sha256 "1f4cbc5243c44e069d5652fe3783c98bd169da4560f00308c60ed084d79bda6e"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/ChasmNetwork/chasm-cli/releases/download/v#{version}/chasm-cli-linux-x64-v#{version}.tar.gz"
    sha256 "11415d0096ce77ab02a0cf1618f884c764456a887f1eb469064c1217db1c25a7"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ChasmNetwork/chasm-cli/releases/download/v#{version}/chasm-cli-linux-arm64-v#{version}.tar.gz"
    sha256 "4ff1e332eb93d91b9e6da11c47fb28e2feabb5ce8be7ee4082b5f3fcb7565684"
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
