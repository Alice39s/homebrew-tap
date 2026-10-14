class Xmtr < Formula
  desc "Concurrent traceroute that maps every hop on xmsl.dev IPMap"
  homepage "https://github.com/Alice39s/xmtr"
  version "0.3.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/Alice39s/xmtr/releases/download/v0.3.0/xmtr-aarch64-apple-darwin.tar.gz"
      sha256 "bb9d31d0106ce65adcc0dfe412af460693c5fb4ec61d7baa2912c56d6d87efd4"
    end
    on_intel do
      url "https://github.com/Alice39s/xmtr/releases/download/v0.3.0/xmtr-x86_64-apple-darwin.tar.gz"
      sha256 "13f34dd2ab9f3ea1e92f1f9d2dcf0917040ac3a86d3755ddf971a465a474541d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Alice39s/xmtr/releases/download/v0.3.0/xmtr-aarch64-unknown-linux-musl.tar.gz"
      sha256 "49e83d523c0e0a753cfa37954cb2f725ef20a139a663691e82200049b0c23e5a"
    end
    on_intel do
      url "https://github.com/Alice39s/xmtr/releases/download/v0.3.0/xmtr-x86_64-unknown-linux-musl.tar.gz"
      sha256 "f47bcde975437655348b71c1b1d4a75c3b0c4471a1937ed6357bdceae5f37e8b"
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
