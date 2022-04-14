cask "anka-virtualization@3.0.0.140.23669920" do
    version "3.0.0.140.23669920"
    sha256 "ab69112cc1888e28cf84b9c6c5642cc49af97797d8172d0381e4ebaf95ae1811"
  
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
