class Distroplane < Formula
  desc "Distribute verified release artifacts to registries and package managers"
  homepage "https://github.com/aalsanie/distroplane"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/aalsanie/distroplane/releases/download/v0.9.2/distroplane_0.9.2_darwin_arm64.tar.gz"
      sha256 "d9f1546c2c931a7dc0232659004d29b955a40b132fe7b500a39525a2c6ee4297"
    end
    on_intel do
      url "https://github.com/aalsanie/distroplane/releases/download/v0.9.2/distroplane_0.9.2_darwin_amd64.tar.gz"
      sha256 "3b1708fd866a1264528321c33e816e6b09ab8989927578d1a7e9733aa31f2693"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/aalsanie/distroplane/releases/download/v0.9.2/distroplane_0.9.2_linux_arm64.tar.gz"
      sha256 "8d5f25b686921d3a963d8f2e6d5b1cf2255117ac51f037b840577a4ee486af03"
    end
    on_intel do
      url "https://github.com/aalsanie/distroplane/releases/download/v0.9.2/distroplane_0.9.2_linux_amd64.tar.gz"
      sha256 "c9ae97ce774815a6b9625a6d73f09eb7058ae08bdaa76321c0d52532eb202717"
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
