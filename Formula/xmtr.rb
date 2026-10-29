class Xmtr < Formula
  desc "Concurrent traceroute that maps every hop on xmsl.dev IPMap"
  homepage "https://github.com/Alice39s/xmtr"
  version "0.3.1"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/Alice39s/xmtr/releases/download/v0.3.1/xmtr-aarch64-apple-darwin.tar.gz"
      sha256 "f974d9d9f68d81f72f1c1b0666455ba6300a5d7c48607630dcd9b82a907d268c"
    end
    on_intel do
      url "https://github.com/Alice39s/xmtr/releases/download/v0.3.1/xmtr-x86_64-apple-darwin.tar.gz"
      sha256 "d2e625a9aa81ef55866820e94bcb443e4a46ab1d05b947bcdcaecb6e7bfb2dce"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Alice39s/xmtr/releases/download/v0.3.1/xmtr-aarch64-unknown-linux-musl.tar.gz"
      sha256 "34527b424d514a2b2bf3f1b7826e27560fec42623305b722b480c7147924fb86"
    end
    on_intel do
      url "https://github.com/Alice39s/xmtr/releases/download/v0.3.1/xmtr-x86_64-unknown-linux-musl.tar.gz"
      sha256 "e467d2b9ef00caf19deffc52493cac08208a6b55dbfb03c35a1f576973059406"
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
