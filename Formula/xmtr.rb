class Xmtr < Formula
  desc "Concurrent traceroute that maps every hop on xmsl.dev IPMap"
  homepage "https://github.com/Alice39s/xmtr"
  version "0.4.4"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/Alice39s/xmtr/releases/download/v0.4.4/xmtr-aarch64-apple-darwin.tar.gz"
      sha256 "d624434ebc5408926aa57a8af85af007e2f638a39f33a10dd365479acdd029bc"
    end
    on_intel do
      url "https://github.com/Alice39s/xmtr/releases/download/v0.4.4/xmtr-x86_64-apple-darwin.tar.gz"
      sha256 "e2ac1cb8e16091380a8cef61889111bfc70747dbfd7c2555ae3c07fdaefcfb56"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Alice39s/xmtr/releases/download/v0.4.4/xmtr-aarch64-unknown-linux-musl.tar.gz"
      sha256 "a82b7a6254662cdf29dc9a69746b2a18f8e68169fa91c298567a9b2c0ae80096"
    end
    on_intel do
      url "https://github.com/Alice39s/xmtr/releases/download/v0.4.4/xmtr-x86_64-unknown-linux-musl.tar.gz"
      sha256 "7698b55ba331dabacdde81cf04e476dbe21262a6506efd2163721e19f6ad31c1"
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
