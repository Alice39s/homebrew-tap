class Xmtr < Formula
  desc "Concurrent traceroute that maps every hop on xmsl.dev IPMap"
  homepage "https://github.com/Alice39s/xmtr"
  version "0.2.4"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/Alice39s/xmtr/releases/download/v0.2.4/xmtr-aarch64-apple-darwin.tar.gz"
      sha256 "8d40f3a89227700239feb4b763375d412154a68c50eeaf907c289e5f87fa07bc"
    end
    on_intel do
      url "https://github.com/Alice39s/xmtr/releases/download/v0.2.4/xmtr-x86_64-apple-darwin.tar.gz"
      sha256 "f770d70bf98be2a4c729460443e698a97d3a84e3dac12e68cf300c5833b213a8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Alice39s/xmtr/releases/download/v0.2.4/xmtr-aarch64-unknown-linux-musl.tar.gz"
      sha256 "a7a984171dd27bf18942d39e439358376acd7a7d70228a182480c6dcf143b017"
    end
    on_intel do
      url "https://github.com/Alice39s/xmtr/releases/download/v0.2.4/xmtr-x86_64-unknown-linux-musl.tar.gz"
      sha256 "f70d92162a573b88878df5d3c91952e8129fe249b782d78387b14ccc53b6b31b"
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
