cask "anka-virtualization@3.0.1.144" do
    version "3.0.1.144"
    sha256 "04c39bdc570c95a3a0ab54d8335263d9ee53680d1c7b5952bd15e1dd1c87b681"
  
    url "https://downloads.veertu.com/anka/Anka-#{version}.pkg",
    verified: "downloads.veertu.com/anka/"
    name "Anka Virtualization"
    desc "CLI tool for managing and creating virtual machines"
    homepage "https://veertu.com/"
  
    depends_on macos: ">= :monterey"
  
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
  