class ChasmCli < Formula
  desc "Chasm CLI"
  homepage "https://github.com/ChasmNetwork/chasm-cli"
  version "0.0.1"
  license "MIT"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/ChasmNetwork/chasm-cli/releases/download/v#{version}/chasm-cli-darwin-x64-v#{version}.tar.gz"
    sha256 "d0ac6a54810b8f8291d423b6942326ffeedab97c75f5b225df99c13e361ffe0a"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ChasmNetwork/chasm-cli/releases/download/v#{version}/chasm-cli-darwin-arm64-v#{version}.tar.gz"
    sha256 "69cd9cc6e06d31db9c318a6d9756ab168ff1978bc109bd9c0361172e5918e5de"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/ChasmNetwork/chasm-cli/releases/download/v#{version}/chasm-cli-linux-x64-v#{version}.tar.gz"
    sha256 "6cdc41b84474a719f212988ed583268c87bb4c87fe2b8985b9ced592c6fa5823"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ChasmNetwork/chasm-cli/releases/download/v#{version}/chasm-cli-linux-arm64-v#{version}.tar.gz"
    sha256 "da2a4c810d42e668804fb97fe0b7168d8e7d247b4d4e0e765be4f77a36481b06"
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
