cask "anka-virtualization@3.0.0.135.16003868-beta5" do
  version "3.0.0.135.16003868-beta5"
  sha256 "51546f34d4e15bd4f54cbcc0bfd04962ba047519cb78c80e6f462deafc513f32"

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
