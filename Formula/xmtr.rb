class Xmtr < Formula
  desc "Concurrent traceroute that maps every hop on xmsl.dev IPMap"
  homepage "https://github.com/Alice39s/xmtr"
  version "0.2.3"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/Alice39s/xmtr/releases/download/v0.2.3/xmtr-aarch64-apple-darwin.tar.gz"
      sha256 "d036cd6c6e6e0a1dda7c3e198e12f6aab9db6f85c61f79aa439e25c8f49db57b"
    end
    on_intel do
      url "https://github.com/Alice39s/xmtr/releases/download/v0.2.3/xmtr-x86_64-apple-darwin.tar.gz"
      sha256 "9a746e34f8ee2caa9b98da8dcb176e15ca28f9657d588015014d2cd29577fb17"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Alice39s/xmtr/releases/download/v0.2.3/xmtr-aarch64-unknown-linux-musl.tar.gz"
      sha256 "6164ac655e6c46737bb117b46f8829916f07cae1fd522ce676f3b05f6714ab02"
    end
    on_intel do
      url "https://github.com/Alice39s/xmtr/releases/download/v0.2.3/xmtr-x86_64-unknown-linux-musl.tar.gz"
      sha256 "dbb70e9bd623bdd08b33eb500226421b56979c48758062b1a377a4183b5656c7"
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
