class Gambiarrascript < Formula
  desc "Linguagem de programacao em portugues, feita na base da gambiarra"
  homepage "https://erikomis.github.io/gambiarrascript/"
  license "MIT"
  version "0.7.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/erikomis/gambiarrascript/releases/download/v#{version}/gs_#{version}_darwin_arm64.tar.gz"
      sha256 "3c6e5ab1481d48de1fc921dc4640f65d896378cdf5742d3639e584930e2acfc8"
    else
      url "https://github.com/erikomis/gambiarrascript/releases/download/v#{version}/gs_#{version}_darwin_amd64.tar.gz"
      sha256 "d774d6d5b161df7c32aaef30fe8b2a865412aa25a7a4d7bb338525afbde3739f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/erikomis/gambiarrascript/releases/download/v#{version}/gs_#{version}_linux_arm64.tar.gz"
      sha256 "89a21d0cb68b4884c7770a7b1a6bd2fdb5a9e4c6f1930a82603b7848b5d6810b"
    else
      url "https://github.com/erikomis/gambiarrascript/releases/download/v#{version}/gs_#{version}_linux_amd64.tar.gz"
      sha256 "0c12c393d91dac61df70f2b7030dbaf4e304759a625f28ed10f6c5e93f4a7915"
    end
  end

  conflicts_with "ghostscript", because: "both install a `gs` binary"

  def install
    bin.install "gs"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gs --version")
  end
end
