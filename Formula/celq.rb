class Celq < Formula
  desc "A Common Expression Language (CEL) CLI Tool"
  homepage "https://github.com/IvanIsCoding/celq"
  version "0.3.3"
  license "MIT OR Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/IvanIsCoding/celq/releases/download/v0.3.3/celq-macos-aarch64.tar.gz"
      sha256 "7c98d580af5d3478c0d2106b32e0aae81a23cf50d4989b1e1aece3ee58b6e267"
    end
    if Hardware::CPU.intel?
      url "https://github.com/IvanIsCoding/celq/releases/download/v0.3.3/celq-macos-x86_64.tar.gz"
      sha256 "13ef03e3829a391e960730567aabd202a2cddc0602f709f0344931bfcbeb2c83"
    end
  end
  
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/IvanIsCoding/celq/releases/download/v0.3.3/celq-linux-aarch64-gnu.tar.gz"
      sha256 "c9deb8facbc8f14912bad7c77b4bbde1d93508761452e23c9cbfee34f51169b7"
    end
    if Hardware::CPU.intel?
      url "https://github.com/IvanIsCoding/celq/releases/download/v0.3.3/celq-linux-x86_64-gnu.tar.gz"
      sha256 "0589fc2ce34d7e8e073eda27cde3d8af7d8c2e5aa2bb3b8a6fda288979730f25"
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