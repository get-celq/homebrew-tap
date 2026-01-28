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
  end
  
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/IvanIsCoding/celq/releases/download/v0.3.1/celq-linux-aarch64-gnu.tar.gz"
      sha256 "8fa2969cb9840fc4c8fca6c6eaa37e00169893ccf3f005913038900db63a7d6b"
    end
    if Hardware::CPU.intel?
      url "https://github.com/IvanIsCoding/celq/releases/download/v0.3.1/celq-linux-x86_64-gnu.tar.gz"
      sha256 "7727d5a10efc832240e10c51559ba0c45720f8f717dabe0a9e34b8c99a9e95ae"
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
