class Xmtr < Formula
  desc "Concurrent traceroute that maps every hop on xmsl.dev IPMap"
  homepage "https://github.com/Alice39s/xmtr"
  version "0.4.1"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/Alice39s/xmtr/releases/download/v0.4.1/xmtr-aarch64-apple-darwin.tar.gz"
      sha256 "ea41b6f3130301ae420cdfc146dc080e826447f8a166b76a6623fc15c70f1668"
    end
    on_intel do
      url "https://github.com/Alice39s/xmtr/releases/download/v0.4.1/xmtr-x86_64-apple-darwin.tar.gz"
      sha256 "ee31f8382b02a7421e894f9a158235c064f65c36d7d091584e80371eab64ffce"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Alice39s/xmtr/releases/download/v0.4.1/xmtr-aarch64-unknown-linux-musl.tar.gz"
      sha256 "03ecc5285321fae27ac6864b3abc193c0ba937a9745666ce383f901d7cb951a2"
    end
    on_intel do
      url "https://github.com/Alice39s/xmtr/releases/download/v0.4.1/xmtr-x86_64-unknown-linux-musl.tar.gz"
      sha256 "52aea0c5d90a4875fee78e0aeac5c0597ff75998a5fe04d59a7031b57530c811"
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
