class Xmtr < Formula
  desc "Concurrent traceroute that maps every hop on xmsl.dev IPMap"
  homepage "https://github.com/Alice39s/xmtr"
  version "0.4.3"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/Alice39s/xmtr/releases/download/v0.4.3/xmtr-aarch64-apple-darwin.tar.gz"
      sha256 "580d0dd21ee4f5c0343865670482802e57659ccb2b3aed000268e8016027cf46"
    end
    on_intel do
      url "https://github.com/Alice39s/xmtr/releases/download/v0.4.3/xmtr-x86_64-apple-darwin.tar.gz"
      sha256 "83a4c2054d796e11c858d949db525fe0395bc73f6ed58da806935ea6c4269b6c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Alice39s/xmtr/releases/download/v0.4.3/xmtr-aarch64-unknown-linux-musl.tar.gz"
      sha256 "653bcd51091116bf76840e1d3a1e7eeb607ecd29106fc663dc63f81f974f77ef"
    end
    on_intel do
      url "https://github.com/Alice39s/xmtr/releases/download/v0.4.3/xmtr-x86_64-unknown-linux-musl.tar.gz"
      sha256 "af9c09c43a6fb6b1eb446f7b6128e3d8232192c41e07ede79b08a8b1d9d8ba72"
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
