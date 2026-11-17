class Xmtr < Formula
  desc "Concurrent traceroute that maps every hop on xmsl.dev IPMap"
  homepage "https://github.com/Alice39s/xmtr"
  version "0.4.2"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/Alice39s/xmtr/releases/download/v0.4.2/xmtr-aarch64-apple-darwin.tar.gz"
      sha256 "39af3721c0fb2a581ff8c0337ec3c005e03eb50be105dfd54d04066f65d94f4b"
    end
    on_intel do
      url "https://github.com/Alice39s/xmtr/releases/download/v0.4.2/xmtr-x86_64-apple-darwin.tar.gz"
      sha256 "393e4ec3cbead2150aeb5e4c921e9ada15014dcef832052572edcaded4e38308"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Alice39s/xmtr/releases/download/v0.4.2/xmtr-aarch64-unknown-linux-musl.tar.gz"
      sha256 "d473b9c2984b7c25df08142a31a06b9ce2cd014216efa99e9c267405a03deda9"
    end
    on_intel do
      url "https://github.com/Alice39s/xmtr/releases/download/v0.4.2/xmtr-x86_64-unknown-linux-musl.tar.gz"
      sha256 "155928247f449d6ea8459dd421df7aef9e291ba19cb66173247ac98f16ab3efc"
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
