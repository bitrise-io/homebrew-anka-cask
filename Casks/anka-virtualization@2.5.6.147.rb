cask "anka-virtualization@2.5.6.147" do
    version "2.5.6.147"
    sha256 "a2723999d02b4fc3d41aab7e9276463f1ccd95a1823068917264cced8d842bdb"
  
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
