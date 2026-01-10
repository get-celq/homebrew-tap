class Celq < Formula
  desc "A Common Expression Language (CEL) CLI Tool"
  homepage "https://github.com/IvanIsCoding/celq"
  version "0.1.1"
  license "MIT OR Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/IvanIsCoding/celq/releases/download/v0.1.1/celq-aarch64-apple-darwin.tar.gz"
      sha256 "fdca719994ff9166a77a150f771b87b351d037318525178360b305ad5c5367da"
    end
    if Hardware::CPU.intel?
      url "https://github.com/IvanIsCoding/celq/releases/download/v0.1.2-alpha.2/celq-x86_64-apple-darwin.tar.gz"
      sha256 "sha256:e6155e1df1803c6719ebb433617dd0b427ffe87f52af27c3a93274e4c8a00984"
    end
  else
    # Fallback to source for Linux
    url "https://github.com/IvanIsCoding/celq/archive/refs/tags/v0.1.1.tar.gz"
    sha256 "7b84882e699f2372a8abbc33ab306851706041b7adaf3d4458e7a659a8eda787"
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
