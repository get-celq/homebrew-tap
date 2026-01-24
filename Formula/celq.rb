class Celq < Formula
  desc "A Common Expression Language (CEL) CLI Tool"
  homepage "https://github.com/IvanIsCoding/celq"
  version "0.3.0"
  license "MIT OR Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/IvanIsCoding/celq/releases/download/v0.3.0/celq-macos-aarch64.tar.gz"
      sha256 "eba898d1e6eb0d4c34fee32b69ecf00a49ccd7be14c2c31de0c35e35c140705d"
    end
    if Hardware::CPU.intel?
      url "https://github.com/IvanIsCoding/celq/releases/download/v0.3.0/celq-macos-x86_64.tar.gz"
      sha256 "4099fb39a8960132f9dc3c6db3762da95b9d574baa456a6bb97a27b660e8424c"
    end
  else
    # Fallback to source for Linux
    url "https://github.com/IvanIsCoding/celq/archive/refs/tags/v0.3.0.tar.gz"
    sha256 "83a4590f04f17df50016bc1c524fcb6f1e3e4a0b941491f2ac6671f6407d87cf"
    depends_on "rust" => :build
  end

  def install
    if OS.mac?
      # Install pre-built binary
      bin.install "celq"
    else
      # Build from source
      system "cargo", "install", "--locked", "--root", prefix, "--path", "."
    end
  end

  test do
    output = shell_output("#{bin}/celq -n --arg='fruit:string=apple' 'fruit.contains(\"a\")'")
    assert_match "true", output
  end
end