class Xmtr < Formula
  desc "Concurrent traceroute that maps every hop on xmsl.dev IPMap"
  homepage "https://github.com/Alice39s/xmtr"
  version "0.2.6"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/Alice39s/xmtr/releases/download/v0.2.6/xmtr-aarch64-apple-darwin.tar.gz"
      sha256 "b9d21abd71f5f97f943a1dab9a1a36966820bda55acddbdf3a71b277ac8d7a6e"
    end
    on_intel do
      url "https://github.com/Alice39s/xmtr/releases/download/v0.2.6/xmtr-x86_64-apple-darwin.tar.gz"
      sha256 "f25547648f37d0418441257ffa3620f1a573a6ec032a46ad136edb8db86dd482"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Alice39s/xmtr/releases/download/v0.2.6/xmtr-aarch64-unknown-linux-musl.tar.gz"
      sha256 "652fee89e8a95ce8c36eb6f5c3ce06cb334ceda843792e6951f9d7eceec70a41"
    end
    on_intel do
      url "https://github.com/Alice39s/xmtr/releases/download/v0.2.6/xmtr-x86_64-unknown-linux-musl.tar.gz"
      sha256 "4f9dc9bc182bdeff30dd5849dea9936140fd059b0a751468e48014377d299d71"
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
