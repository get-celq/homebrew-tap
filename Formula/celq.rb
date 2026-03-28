class Celq < Formula
  desc "A Common Expression Language (CEL) CLI Tool"
  homepage "https://github.com/IvanIsCoding/celq"
  version "0.4.0"
  license "MIT OR Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/IvanIsCoding/celq/releases/download/v0.4.0/celq-macos-aarch64.tar.gz"
      sha256 "689bde5535f9a07ed722c8b472db527c1ab852974807b9f8bc290214ad89ba62"
    end
    if Hardware::CPU.intel?
      url "https://github.com/IvanIsCoding/celq/releases/download/v0.4.0/celq-macos-x86_64.tar.gz"
      sha256 "82df4258df9e811fe66b651d5b476bea3752c1fffe8a6c262460d5cdc543f88e"
    end
  end
  
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/IvanIsCoding/celq/releases/download/v0.4.0/celq-linux-aarch64-gnu.tar.gz"
      sha256 "3696ef1140fd534e2614780ed239dd03604d6edfe77c675e429af8eb6b9b59a2"
    end
    if Hardware::CPU.intel?
      url "https://github.com/IvanIsCoding/celq/releases/download/v0.4.0/celq-linux-x86_64-gnu.tar.gz"
      sha256 "d105c5c26204d3f32c48b5d03ef3418ee379b5338e84aafa11accafe963b5156"
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