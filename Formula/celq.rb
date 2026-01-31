class Celq < Formula
  desc "A Common Expression Language (CEL) CLI Tool"
  homepage "https://github.com/IvanIsCoding/celq"
  version "0.3.2"
  license "MIT OR Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/IvanIsCoding/celq/releases/download/v0.3.2/celq-macos-aarch64.tar.gz"
      sha256 "f72482f93f3fe605306efc9de965ed285cf1b1851b661c15dca469b2ec0a8fcd"
    end
    if Hardware::CPU.intel?
      url "https://github.com/IvanIsCoding/celq/releases/download/v0.3.2/celq-macos-x86_64.tar.gz"
      sha256 "3cd0e08ec56b7925f107af0dcf2b9957fbaf489f75d1bc92dea674ace1839b71"
    end
  end
  
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/IvanIsCoding/celq/releases/download/v0.3.2/celq-linux-aarch64-gnu.tar.gz"
      sha256 "6786931b0003273bb177aca70725da11994fe84231f64c8acee3200b19eff9b2"
    end
    if Hardware::CPU.intel?
      url "https://github.com/IvanIsCoding/celq/releases/download/v0.3.2/celq-linux-x86_64-gnu.tar.gz"
      sha256 "42cdfc4e0f81da0e2b223e9297fb1cf415c51fcdd53e82625d391801069ce2dc"
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
