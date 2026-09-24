class Celq < Formula
  desc "A Common Expression Language (CEL) CLI Tool"
  homepage "https://github.com/IvanIsCoding/celq"
  version "0.7.1"
  license "MIT OR Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/IvanIsCoding/celq/releases/download/v0.7.1/celq-macos-aarch64.tar.zst"
      sha256 "4eb861bd8d8b2772bd9c3eb86d7aeed9c016a16e4fc5acc6f15653c5a3993201"
    end
    if Hardware::CPU.intel?
      url "https://github.com/IvanIsCoding/celq/releases/download/v0.7.1/celq-macos-x86_64.tar.gz"
      sha256 "2b4a1f0f2470edb39bfe95bab947c86c95cc68fb82f867cc79246d6fb88a5009"
    end
  end
  
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/IvanIsCoding/celq/releases/download/v0.7.1/celq-linux-aarch64-gnu.tar.gz"
      sha256 "8df641a435131f3a371597b99962e9f4df9258e2e7ace7f707ae9380ed0114d9"
    end
    if Hardware::CPU.intel?
      url "https://github.com/IvanIsCoding/celq/releases/download/v0.7.1/celq-linux-x86_64-gnu.tar.gz"
      sha256 "88e237e8c550556fdbbf2c4ff6ebd1b05921924df2d611ec756b1ad0e5641db2"
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
