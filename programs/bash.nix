{
  enable = true;
  shellAliases = {
    "c" = "cd";
    "cl" = "clear";
    "em" = "$EDITOR";
    "ff" = "fastfetch";
    "g" = "git";
    "gps" = "git push";
    "ls" = "ls -a -F --color=auto";
    "ll" = "ls -l";
    "mkd" = "mkdir -p";

    ".." = "cd ..";
    "." = "ls";
  };
  bashrcExtra = ''
        cf() {
          query="$1"
          cd $(echo **/$query* | awk 'BEGIN { FS=" " } { print $1 }')
        } 
  '';
}
