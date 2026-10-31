class Xmtr < Formula
  desc "Concurrent traceroute that maps every hop on xmsl.dev IPMap"
  homepage "https://github.com/Alice39s/xmtr"
  version "0.3.3"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/Alice39s/xmtr/releases/download/v0.3.3/xmtr-aarch64-apple-darwin.tar.gz"
      sha256 "fcd12879cb29cc2a97e05947ea931afcb3f9a173945d3951b7cc3ebcfaa768af"
    end
    on_intel do
      url "https://github.com/Alice39s/xmtr/releases/download/v0.3.3/xmtr-x86_64-apple-darwin.tar.gz"
      sha256 "839de584deca669ac04fa74e076468ecb0662a9526b959e5b5afa21a17993743"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Alice39s/xmtr/releases/download/v0.3.3/xmtr-aarch64-unknown-linux-musl.tar.gz"
      sha256 "a1348f919ed9830c178ef29d218f890735da5d8a9ca32ef6e6b0668937e0fae8"
    end
    on_intel do
      url "https://github.com/Alice39s/xmtr/releases/download/v0.3.3/xmtr-x86_64-unknown-linux-musl.tar.gz"
      sha256 "70858c0f4e289c639a5627af3cec14fed4472086e426aa9493f6c91241f54353"
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
