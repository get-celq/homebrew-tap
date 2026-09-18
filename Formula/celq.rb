class Celq < Formula
  desc "A Common Expression Language (CEL) CLI Tool"
  homepage "https://github.com/IvanIsCoding/celq"
  version "0.7.0"
  license "MIT OR Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/IvanIsCoding/celq/releases/download/v0.7.0/celq-macos-aarch64.tar.zst"
      sha256 "e44b4c6b916e9055e191ad5ab607c48c98cce0f99cccf8ffb35e9b71c5ac9f5d"
    end
    if Hardware::CPU.intel?
      url "https://github.com/IvanIsCoding/celq/releases/download/v0.7.0/celq-macos-x86_64.tar.gz"
      sha256 "56b914fad6565c74a8fe4a197dc9acd1368cadc72020fa5bbbdccc3bbdb160bd"
    end
  end
  
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/IvanIsCoding/celq/releases/download/v0.7.0/celq-linux-aarch64-gnu.tar.zst"
      sha256 "330fc58ec334b7aa85c4d411f0abbae3370d48e129bf61551189b9ecb6ece078"
    end
    if Hardware::CPU.intel?
      url "https://github.com/IvanIsCoding/celq/releases/download/v0.7.0/celq-linux-x86_64-gnu.tar.zst"
      sha256 "cb7e9d9c2d5a4b11f1e0b298ea10c581efd03bf569520b159a1626ebd651c0eb"
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
