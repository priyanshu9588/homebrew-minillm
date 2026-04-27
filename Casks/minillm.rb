cask "minillm" do
  version "0.5.0"
  sha256 "20fc37090a95572a9212a03591931c02ca61ae014927874d4021467318fc6867"

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
