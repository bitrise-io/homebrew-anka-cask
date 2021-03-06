cask "anka-virtualization@2.3.0" do
  version "2.3.0.122"
  sha256 "6bedb7c4519b28f8619f2e8a88270fe92ed4a575dbadf00c5009dbddec5cafc8"

  # d1efqjhnhbvc57.cloudfront.net/ was verified as official when first introduced to the cask
  url "https://d1efqjhnhbvc57.cloudfront.net/Anka-#{version}.pkg"
  appcast "https://ankadocs.veertu.com/docs/release-notes/"
  name "Anka Virtualization"
  desc "CLI tool for managing and creating macOS virtual machines"
  homepage "https://veertu.com/"

  depends_on macos: ">= :yosemite"

  pkg "Anka-#{version}.pkg"

  uninstall launchctl: [
    "com.veertu.nlimit",
    "com.veertu.vlaunch",
    "com.veertu.anka.lupd",
    "com.veertu.anka.ankakbd",
    "com.veertu.anka.ankanetd",
  ],
            script:    {
              executable: "/Library/Application Support/Veertu/Anka/tools/uninstall.sh",
              args:       ["-f"],
              sudo:       true,
            }

  zap trash: [
    "~/.anka",
    "~/Library/Application Support/Veertu/Anka",
    "~/Library/Logs/Anka",
    "~/Library/Preferences/com.veertu.ankaview.plist",
    "/Library/Application Support/Veertu/Anka",
  ],
      rmdir: [
        "~/Library/Application Support/Veertu",
        "/Library/Application Support/Veertu",
      ]

  caveats do
    license "https://veertu.com/terms-and-conditions/"
  end
end
