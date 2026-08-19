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
    "l" = "ls";
    "ll" = "ls -l";
    "mkd" = "mkdir -p";
    "nrs" = "nr s";
    "nrb" = "nr b";

    ".." = "cd ..";
    "." = "ls";
  };
  bashrcExtra = ''
        cf() {
          query="$1"
          cd $(echo **/$query* | awk 'BEGIN { FS=" " } { print $1 }')
        } 
        ddate() {
          cmd="ntpdate time.google.com; date --set '+1 second'"
          echo "running: $cmd"
          sudo sh -c "$cmd"
        }
        nr() {
          local OP=null
          local CMD=null
          case $1 in
          b)
            OP=boot
            ;;
          s)
            OP=switch
            ;;
          *)
            echo "[ERROR] invalid OP arg"
            return
            ;;
          esac
          if [[ $# -lt 2 ]]; then
            CMD="sudo nixos-rebuild $OP"
          else
            CMD="sudo nixos-rebuild $OP --flake .#$2 --impure"
          fi 
          echo "running: $CMD"
          $CMD
        }
  '';
}
