class Xmtr < Formula
  desc "Concurrent traceroute that maps every hop on xmsl.dev IPMap"
  homepage "https://github.com/Alice39s/xmtr"
  version "0.2.5"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/Alice39s/xmtr/releases/download/v0.2.5/xmtr-aarch64-apple-darwin.tar.gz"
      sha256 "f4ae8e70e5d064723cc0fea5359289df069127d98631a9b980efdab6224603d5"
    end
    on_intel do
      url "https://github.com/Alice39s/xmtr/releases/download/v0.2.5/xmtr-x86_64-apple-darwin.tar.gz"
      sha256 "16b00aecf29b87eb6a020f77443028d5f969c25c30eeaf1e044816f9f0ebe8bb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Alice39s/xmtr/releases/download/v0.2.5/xmtr-aarch64-unknown-linux-musl.tar.gz"
      sha256 "722d969e2a66400e3b97f600df4a23cfde8100316b73bfcacc1fdcdda34cefc5"
    end
    on_intel do
      url "https://github.com/Alice39s/xmtr/releases/download/v0.2.5/xmtr-x86_64-unknown-linux-musl.tar.gz"
      sha256 "e5ab5c552646a4bad9999569a963c13697b5a3b83e0a5e252d9ad238a345f512"
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
