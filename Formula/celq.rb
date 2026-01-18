class Celq < Formula
  desc "A Common Expression Language (CEL) CLI Tool"
  homepage "https://github.com/IvanIsCoding/celq"
  version "0.2.0"
  license "MIT OR Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/IvanIsCoding/celq/releases/download/v0.2.0/celq-macos-aarch64.tar.gz"
      sha256 "94cc9ed766b0de7aed4be19267ec0346ed13a6663dd3b4d24aa9a2ba7169a465"
    end
    if Hardware::CPU.intel?
      url "https://github.com/IvanIsCoding/celq/releases/download/v0.2.0/celq-macos-x86_64.tar.gz"
      sha256 "b872f208b35f50bdac70150dc7d61c7daafb3d327d5488d4a03063dde4d99cff"
    end
  else
    # Fallback to source for Linux
    url "https://github.com/IvanIsCoding/celq/archive/refs/tags/v0.2.0.tar.gz"
    sha256 "f1430faa5781dcc0a2ae1954d945e36334b189120a9bec6568226b43690f8bd8"
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