{pkgs, ...}: {
  stylix = { 
    enable = true;
    autoEnable = false;
    #image = builtins.toPath self.wp-path;
    fonts =
      let 
        font = {
          package = pkgs.libertinus;
          name = "Libertinus Mono"; 
        };
      in
      {
        serif = font; 
        sansSerif = font; 
        emoji = font; 
        monospace = font; 
        sizes = {
          applications = 14;
          desktop = 14;
          popups = 16;
          terminal = 14;
        };
      };
    base16Scheme = {
      author = "Stylix";
      base00 = "081d2e";
      base01 = "004b72";
      base02 = "366da6";
      base03 = "72a3cc";
      base04 = "a1bbdc";
      base05 = "dae4ee";
      base06 = "eaf2f4";
      base07 = "eaf2f5";
      base08 = "5c95cc";
      base09 = "6896b7";
      base0A = "7193c1";
      base0B = "5797c5";
      base0C = "7f93ac";
      base0D = "6c97aa";
      base0E = "6895be";
      base0F = "7395ae";
      scheme = "Stylix";
      slug = "stylix";
    };
    polarity = "dark";
  };
}
