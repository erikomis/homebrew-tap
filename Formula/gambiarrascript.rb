class Gambiarrascript < Formula
  desc "Linguagem de programacao em portugues, feita na base da gambiarra"
  homepage "https://erikomis.github.io/gambiarrascript/"
  license "MIT"
  version "0.3.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/erikomis/gambiarrascript/releases/download/v#{version}/gs_#{version}_darwin_arm64.tar.gz"
      sha256 "5f64908ed1c18ec367f0e842ec492f9816221521d67c3255bbfb49e6079c3bd6"
    else
      url "https://github.com/erikomis/gambiarrascript/releases/download/v#{version}/gs_#{version}_darwin_amd64.tar.gz"
      sha256 "06f373e479db595cf039889e197c26bdd3f17bf23a6853d913d44098f00013a0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/erikomis/gambiarrascript/releases/download/v#{version}/gs_#{version}_linux_arm64.tar.gz"
      sha256 "891aa20edbe34041cd1680ddff0e3a2925998b72161bd080c9217f2ee050c24b"
    else
      url "https://github.com/erikomis/gambiarrascript/releases/download/v#{version}/gs_#{version}_linux_amd64.tar.gz"
      sha256 "774d80bf0c0d01ba86b9014f8c85442e110670e22775379c55e950603be94efe"
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
