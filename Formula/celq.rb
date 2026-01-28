class Celq < Formula
  desc "A Common Expression Language (CEL) CLI Tool"
  homepage "https://github.com/IvanIsCoding/celq"
  version "0.3.1"
  license "MIT OR Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/IvanIsCoding/celq/releases/download/v0.3.1/celq-macos-aarch64.tar.gz"
      sha256 "606ff552e277e3d1ca477f63f3098b22ec4b8ce4843667cd5d3e770c9fcada7a"
    end
    if Hardware::CPU.intel?
      url "https://github.com/IvanIsCoding/celq/releases/download/v0.3.1/celq-macos-x86_64.tar.gz"
      sha256 "e2d217ae79ddba1b8f2086928a045ed224b49bebae53f0c8af26f1afe4762a02"
    end
  else
    # Fallback to source for Linux
    url "https://github.com/IvanIsCoding/celq/archive/refs/tags/v0.3.1.tar.gz"
    sha256 "9d90ed01796a225e81bcdf8bdca702912e268e108e1e4adfea4524babeb7368c"
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