class Celq < Formula
  desc "A Common Expression Language (CEL) CLI Tool"
  homepage "https://github.com/IvanIsCoding/celq"
  version "0.3.4"
  license "MIT OR Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/IvanIsCoding/celq/releases/download/v0.3.4/celq-macos-aarch64.tar.gz"
      sha256 "183794f8efb6bce99c0a0a7b8b0ea8c54104115189995965815e21d2a4866bbf"
    end
    if Hardware::CPU.intel?
      url "https://github.com/IvanIsCoding/celq/releases/download/v0.3.4/celq-macos-x86_64.tar.gz"
      sha256 "583628fd9117c0672cf3d4a622668b0e5abbca72bc5b249f4566a954fd2a805c"
    end
  end
  
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/IvanIsCoding/celq/releases/download/v0.3.4/celq-linux-aarch64-gnu.tar.gz"
      sha256 "ced6703e4caf21ab74b5fd8177ea833754a887cc42b02cf3adacd6461cfa67c1"
    end
    if Hardware::CPU.intel?
      url "https://github.com/IvanIsCoding/celq/releases/download/v0.3.4/celq-linux-x86_64-gnu.tar.gz"
      sha256 "d45753f8917dd99e8de51ae6c105ddb5fce115edfc191d50ba27d8aff069efe4"
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