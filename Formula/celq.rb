class Celq < Formula
  desc "A Common Expression Language (CEL) CLI Tool"
  homepage "https://github.com/IvanIsCoding/celq"
  version "0.5.0"
  license "MIT OR Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/IvanIsCoding/celq/releases/download/v0.5.0/celq-macos-aarch64.tar.gz"
      sha256 "0e4f24fa47f089ecfce64f47320b1fb116e8baa0c1f13d26b03d0561ba0ea96c"
    end
    if Hardware::CPU.intel?
      url "https://github.com/IvanIsCoding/celq/releases/download/v0.5.0/celq-macos-x86_64.tar.gz"
      sha256 "d1807817c1a82c5275dbc681f0149c630bfad7e47f904feabb2da0a87abd3c6a"
    end
  end
  
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/IvanIsCoding/celq/releases/download/v0.5.0/celq-linux-aarch64-gnu.tar.gz"
      sha256 "dec99f525b37a5d0dba949b648445393705346481a313806009c742c67cf1608"
    end
    if Hardware::CPU.intel?
      url "https://github.com/IvanIsCoding/celq/releases/download/v0.5.0/celq-linux-x86_64-gnu.tar.gz"
      sha256 "85294f1255489aec7b0b11bb4f49b4b2f247bc4c4516ab873b105e22bb8d5812"
    end
  end

  def install
    bin.install "celq"
  end

  test do
    output = shell_output("#{bin}/celq -n --arg='fruit:string=apple' 'fruit.contains(\"a\")'")
    assert_match "true", output
  end
end