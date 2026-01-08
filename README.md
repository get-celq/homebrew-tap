# celq's Homebrew Tap

This is a [Homebrew](https://brew.sh) tap for [celq](https://github.com/IvanIsCoding/celq)

## Installation

```bash
brew install get-celq/tap/celq
```

## About

celq is a Common Expression Language (CEL) CLI Tool. Think of it as `jq` with CEL syntax.

```bash
brew install get-celq/tap/celq
```

**Usage:**
```bash
echo '["apples", "bananas", "blueberry"]' | celq 'this.filter(s, s.contains("a"))'
# Outputs: ["apples","bananas"]
```

**Links:**
- [GitHub Repository](https://github.com/IvanIsCoding/celq)
- [Documentation](https://docs.rs/celq/latest/celq/)
- [Crates.io](https://crates.io/crates/celq)
