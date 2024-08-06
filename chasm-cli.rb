class ChasmCli < Formula
  desc "Chasm CLI"
  homepage "https://github.com/ChasmNetwork/chasm-cli"
  version "latest"

  if Hardware::CPU.arm?
    url "https://github.com/ChasmNetwork/chasm-cli/releases/download/latest/chasm-cli-darwin-arm64-latest.tar.gz"
    sha256 "53993b7e0b7591b5d96170983fe6ba60239d1406b3f416cff21c0988c04d44d8"
  else
    url "https://github.com/ChasmNetwork/chasm-cli/releases/download/latest/chasm-cli-darwin-x64-latest.tar.gz"
    sha256 "bd411f701c1a4a5e80e1231008bac6ba95815981e1a566f3c8253dcafc271f5b"
  end

  def install
    if Hardware::CPU.arm?
      bin.install "cli-macos-arm64" => "chasm-cli"
    else
      bin.install "cli-macos-x64" => "chasm-cli"
    end
  end

  test do
    system "#{bin}/chasm-cli", "--version"
  end
end
