class Xmtr < Formula
  desc "Concurrent traceroute that maps every hop on xmsl.dev IPMap"
  homepage "https://github.com/Alice39s/xmtr"
  version "0.3.4"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/Alice39s/xmtr/releases/download/v0.3.4/xmtr-aarch64-apple-darwin.tar.gz"
      sha256 "5da95736ded8bb0a4f97df998c22fb13fd585ce9a6daff509039abedb7f03a11"
    end
    on_intel do
      url "https://github.com/Alice39s/xmtr/releases/download/v0.3.4/xmtr-x86_64-apple-darwin.tar.gz"
      sha256 "3cd7247bd55b16e0f341f3ed10ec873f226a4b59608df62b8a94150f3e8f9507"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Alice39s/xmtr/releases/download/v0.3.4/xmtr-aarch64-unknown-linux-musl.tar.gz"
      sha256 "0073852019a9b9b5d9fdb15ea97aecc78919e022bdff2dd7d77d43af5184c8b3"
    end
    on_intel do
      url "https://github.com/Alice39s/xmtr/releases/download/v0.3.4/xmtr-x86_64-unknown-linux-musl.tar.gz"
      sha256 "7d4315814b5100e2d412dd18c799a75a912f4546ee6e437de047084ff8490630"
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
