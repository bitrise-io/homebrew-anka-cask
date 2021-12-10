cask "anka-virtualization@2.5.3.135.5848058" do
  version "2.5.3.135.5848058"
  sha256 "8cdbfdb6507e53123ebf7abd52c40ec291de2d79263c6557ae0d529e83cd9e17"

  url "https://downloads.veertu.com/anka/Anka-#{version}.pkg",
      verified: "downloads.veertu.com/anka/"
  appcast "https://ankadocs.veertu.com/docs/release-notes/"
  name "Anka Virtualization"
  desc "CLI tool for managing and creating virtual machines"
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
    "~/Library/Application Support/CrashReporter/ankahv_*.plist",
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
