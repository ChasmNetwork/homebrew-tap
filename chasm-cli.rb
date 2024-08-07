class ChasmCli < Formula
  desc "Chasm CLI"
  homepage "https://github.com/ChasmNetwork/chasm-cli"
  version "0.0.1"
  license "MIT"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/ChasmNetwork/chasm-cli/releases/download/v#{version}/chasm-cli-darwin-x64-v#{version}.tar.gz"
    sha256 "0e454a91326f64d92e98a86eb76e6d195d71752c851808e4c8730c3f04b58e34"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ChasmNetwork/chasm-cli/releases/download/v#{version}/chasm-cli-darwin-arm64-v#{version}.tar.gz"
    sha256 "50f5f006a518b4f38f9dc6c6886cf58d73253cc980f08958ce342322a30dfcf7"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/ChasmNetwork/chasm-cli/releases/download/v#{version}/chasm-cli-linux-x64-v#{version}.tar.gz"
    sha256 "12af7344e0ed8f9901b9a842db72866dc43e8da5aec202355c3bfd5a6fe0a75f"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ChasmNetwork/chasm-cli/releases/download/v#{version}/chasm-cli-linux-arm64-v#{version}.tar.gz"
    sha256 "3c0e61c79c0c4ea54a75a4e2ad855a9967d3eb39fb31acdfa2328805cf0cf985"
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
