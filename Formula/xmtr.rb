class Xmtr < Formula
  desc "Concurrent traceroute that maps every hop on xmsl.dev IPMap"
  homepage "https://github.com/Alice39s/xmtr"
  version "0.4.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/Alice39s/xmtr/releases/download/v0.4.0/xmtr-aarch64-apple-darwin.tar.gz"
      sha256 "9a6281da900f4dbf1e7e5157881d1f7bea0b24d0a205df53c2d63cb65eb9bdd8"
    end
    on_intel do
      url "https://github.com/Alice39s/xmtr/releases/download/v0.4.0/xmtr-x86_64-apple-darwin.tar.gz"
      sha256 "d4a8bb46f70b47f003bf9a26c436e34845226b0d1c7ba9926f723dbb42dccc9b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Alice39s/xmtr/releases/download/v0.4.0/xmtr-aarch64-unknown-linux-musl.tar.gz"
      sha256 "6412711e5685bcce71ab42e6df74a8abcfd88958b010d6991af79fd9b6cdfbeb"
    end
    on_intel do
      url "https://github.com/Alice39s/xmtr/releases/download/v0.4.0/xmtr-x86_64-unknown-linux-musl.tar.gz"
      sha256 "aadfa67aaa352055e622483fb10adc475372bef573022e67951e4e9a285fd233"
    end
  end

  def install
    bin.install "xmtr"
  end

  def caveats
    <<~TEXT
      Tracing needs raw sockets. Run xmtr with sudo, or on Linux allow them once:
        sudo setcap cap_net_raw+ep #{opt_bin}/xmtr
      Update xmtr with brew upgrade rather than xmtr self update.
    TEXT
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/xmtr --version")
  end
end
