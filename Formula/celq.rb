class Celq < Formula
  desc "A Common Expression Language (CEL) CLI Tool"
  homepage "https://github.com/IvanIsCoding/celq"
  version "0.6.0"
  license "MIT OR Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/IvanIsCoding/celq/releases/download/v0.6.0/celq-macos-aarch64.tar.gz"
      sha256 "d1768458f82cca3f9311f9eed3927e243ddaf2e7b8304fc93af36b60f12e56a4"
    end
    if Hardware::CPU.intel?
      url "https://github.com/IvanIsCoding/celq/releases/download/v0.6.0/celq-macos-x86_64.tar.gz"
      sha256 "1f4b1e6e6f6b8bee112d523fcdbbccf97166536f4a2a9cb00dc32680ff83aef1"
    end
  end
  
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/IvanIsCoding/celq/releases/download/v0.6.0/celq-linux-aarch64-gnu.tar.gz"
      sha256 "6521b51c8361f6abf34bef9e88f853ba9e2ced42e2487dfe43751ea54d22eb6f"
    end
    if Hardware::CPU.intel?
      url "https://github.com/IvanIsCoding/celq/releases/download/v0.6.0/celq-linux-x86_64-gnu.tar.gz"
      sha256 "b7ebc80ab9e4a3307307396bc4458dbcb538ba5352abce84491740bbc1487712"
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