cask "anka-virtualization@3.1.1.152" do
    version "3.1.1.152"
    arch "arm"
    sha256 "a1fd1558fc7ba5f9b3c9eb3636e33b1b5c99be79dd6521a491e14b101810e004"

    url "https://downloads.veertu.com/anka/Anka-#{version}-#{arch}.pkg",
        verified: "downloads.veertu.com/anka/"
    appcast "https://ankadocs.veertu.com/docs/release-notes/"
    name "Anka Virtualization"
    desc "CLI tool for managing and creating virtual machines"
    homepage "https://veertu.com/"

    depends_on macos: ">= :monterey"

    pkg "Anka-#{version}-#{arch}.pkg"

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
