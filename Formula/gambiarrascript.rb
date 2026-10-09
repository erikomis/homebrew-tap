class Gambiarrascript < Formula
  desc "Linguagem de programacao em portugues, feita na base da gambiarra"
  homepage "https://erikomis.github.io/gambiarrascript/"
  license "MIT"
  version "0.8.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/erikomis/gambiarrascript/releases/download/v#{version}/gs_#{version}_darwin_arm64.tar.gz"
      sha256 "dff3159ee8d90c707f51cf5bad25037745bdadb371bc7050b4019999dec436ab"
    else
      url "https://github.com/erikomis/gambiarrascript/releases/download/v#{version}/gs_#{version}_darwin_amd64.tar.gz"
      sha256 "5fa7eb7f48ed467d568baccfc4eb43b64d00ec11946f233494a65003446ce5e2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/erikomis/gambiarrascript/releases/download/v#{version}/gs_#{version}_linux_arm64.tar.gz"
      sha256 "e1923362244f677724fb0f678a1c00df1358ef0cf85232c092bdffba5be40395"
    else
      url "https://github.com/erikomis/gambiarrascript/releases/download/v#{version}/gs_#{version}_linux_amd64.tar.gz"
      sha256 "d7c71521ffc7786e45aa9579682d72b5a058c62d826869fb3b13f9e8bbbd572f"
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
