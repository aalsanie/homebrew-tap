class Distroplane < Formula
  desc "Distribute verified release artifacts to registries and package managers"
  homepage "https://github.com/aalsanie/distroplane"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/aalsanie/distroplane/releases/download/v0.9.1/distroplane_0.9.1_darwin_arm64.tar.gz"
      sha256 "f74133aa2df8fe166b50a40d7667c55e1f692dfd9febb55e2e52cee9511993c5"
    end
    on_intel do
      url "https://github.com/aalsanie/distroplane/releases/download/v0.9.1/distroplane_0.9.1_darwin_amd64.tar.gz"
      sha256 "19986cd5b57516af121d25ae49ff69e82d641ae794175965a008dbe41b024efc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/aalsanie/distroplane/releases/download/v0.9.1/distroplane_0.9.1_linux_arm64.tar.gz"
      sha256 "8436afe88ed3789d9604cf82c0d21d67a6926b2da14a2adf5ad948eae44eb766"
    end
    on_intel do
      url "https://github.com/aalsanie/distroplane/releases/download/v0.9.1/distroplane_0.9.1_linux_amd64.tar.gz"
      sha256 "e6c5bec59bf592a959108dd2137dd526e52e7332b616c88cb740cc1412128405"
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
