class Xmtr < Formula
  desc "Concurrent traceroute that maps every hop on xmsl.dev IPMap"
  homepage "https://github.com/Alice39s/xmtr"
  version "0.3.6"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/Alice39s/xmtr/releases/download/v0.3.6/xmtr-aarch64-apple-darwin.tar.gz"
      sha256 "7d85238f653ca0f9954d9694ffb61a3ad91d2b7548686cbd73a5e1de124fdf46"
    end
    on_intel do
      url "https://github.com/Alice39s/xmtr/releases/download/v0.3.6/xmtr-x86_64-apple-darwin.tar.gz"
      sha256 "c4dbcb02167a64a120aca88101da881203c0f88975df73229c495230e008cdf9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Alice39s/xmtr/releases/download/v0.3.6/xmtr-aarch64-unknown-linux-musl.tar.gz"
      sha256 "8283b52f2831c4eefea5cbbfbd4cbbdc313324f8ff5538b19e7352a740516ab8"
    end
    on_intel do
      url "https://github.com/Alice39s/xmtr/releases/download/v0.3.6/xmtr-x86_64-unknown-linux-musl.tar.gz"
      sha256 "55ce406e204203f1d790ce3911ad44640741e8083155ac45d872438afa5f316b"
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
