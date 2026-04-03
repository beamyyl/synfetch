diff --git a/flake.nix b/flake.nix
index dc6bd97..a33b15a 100644
--- a/flake.nix
+++ b/flake.nix
@@ -17,7 +17,8 @@
       perSystem = {pkgs, ...}: {
         packages.default = pkgs.writeShellApplication {
           name = "synfetch";
-          text = ./synfetch;
+          # excludeShellChecks = ["SC2034" "SC2155" "SC2012" "SC2086" "SC1091" "SC2005" "SC2126"];
+          text = builtins.readFile ./synfetch;
         };
       };
     };
