class Distroplane < Formula
  desc "Distribute verified release artifacts to registries and package managers"
  homepage "https://github.com/aalsanie/distroplane"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/aalsanie/distroplane/releases/download/v0.9.3/distroplane_0.9.3_darwin_arm64.tar.gz"
      sha256 "5cb937c44cb407d2456123a0f2f9e50b6a6f703f095fd88b80265cdf60e504a7"
    end
    on_intel do
      url "https://github.com/aalsanie/distroplane/releases/download/v0.9.3/distroplane_0.9.3_darwin_amd64.tar.gz"
      sha256 "2a2f96ef2d03df67da9c28b58c737dcd2533553f5e660da58ee06f1588e7f181"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/aalsanie/distroplane/releases/download/v0.9.3/distroplane_0.9.3_linux_arm64.tar.gz"
      sha256 "36bdfb83209cfe7060ebffca28b85b4996d4fdc3b05d130e732b7b6426432055"
    end
    on_intel do
      url "https://github.com/aalsanie/distroplane/releases/download/v0.9.3/distroplane_0.9.3_linux_amd64.tar.gz"
      sha256 "900e4e55aa4c54990c053d2cb7c55b5c7e814a76f76314c266380a53ab88335c"
    end
  end

  def install
    bin.install "bin/distroplane"
    libexec.install Dir["libexec/distroplane-provider-*"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/distroplane version")
    %w[homebrew npm sdkman winget].each do |provider|
      file = libexec/"distroplane-provider-#{provider}"
      assert_path_exists file
      assert_predicate file, :executable?
    end
  end
end
