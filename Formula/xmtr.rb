class Xmtr < Formula
  desc "Concurrent traceroute that maps every hop on xmsl.dev IPMap"
  homepage "https://github.com/Alice39s/xmtr"
  version "0.3.2"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/Alice39s/xmtr/releases/download/v0.3.2/xmtr-aarch64-apple-darwin.tar.gz"
      sha256 "2fc0fc4c2ed5b57624248780d795f65fd6eece4b62e047247e3845e6ed5a6a0a"
    end
    on_intel do
      url "https://github.com/Alice39s/xmtr/releases/download/v0.3.2/xmtr-x86_64-apple-darwin.tar.gz"
      sha256 "3f084ff07cef9a4cf6388d43cb74fb5fece36fa7017b7438c0112859e22f6f38"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Alice39s/xmtr/releases/download/v0.3.2/xmtr-aarch64-unknown-linux-musl.tar.gz"
      sha256 "6e50ac563337a3d7caeb40f6519493893d21bcc7e3d1aff21c2ea0b127691951"
    end
    on_intel do
      url "https://github.com/Alice39s/xmtr/releases/download/v0.3.2/xmtr-x86_64-unknown-linux-musl.tar.gz"
      sha256 "501a90b3feaa1b0390b4ecbf0aa1168fa07cfdcc4d8418d13b7f3a06aa2503d0"
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
