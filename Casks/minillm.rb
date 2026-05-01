cask "minillm" do
  version "0.6.1"
  sha256 "db2fe220ebed537b368b5e9ce645aa892b34c25cc4f31b473989790009a9e8a5"

  url "https://github.com/priyanshu9588/homebrew-minillm/releases/download/v#{version}/MiniLLM_#{version}_aarch64.dmg",
      verified: "github.com/priyanshu9588/homebrew-minillm/"
  name "MiniLLM"
  desc "Private on-device LLM chat powered by Gemma 4"
  homepage "https://github.com/priyanshu9588/minillm"

  depends_on arch: :arm64
  depends_on macos: ">= :monterey"

  app "MiniLLM.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/MiniLLM.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/dev.priyanshu.minillm",
    "~/Library/Caches/dev.priyanshu.minillm",
    "~/Library/Preferences/dev.priyanshu.minillm.plist",
    "~/Library/Saved Application State/dev.priyanshu.minillm.savedState",
    "~/Library/WebKit/dev.priyanshu.minillm",
  ]
end
