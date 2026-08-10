{ pkgs, ... }: {
  home.stateVersion = "26.11";

  programs = {
    firefox.enable = true;
    kitty.enable = true;
    git = {
      enable = true;
      settings = {
        alias = {
          a = "add";
          aa = "add -A";
          b = "branch";
          bm = "branch -M";
          bd = "branch -D";
          c = "commit";
          ca = "commit --all";
          cam = "commit --all -m";
          cfg = "config";
          ch = "checkout";
          cl = "clone";
          cld = "clone --depth 1";
          clr = "clone --recurse";
          cldr = "clone --depth 1 --recurse";
          clrd = "clone --depth 1 --recurse";
          d = "diff";
          dh = "diff HEAD";
          do = "diff origin/main";
          dt = "difftool -y";
          dto = "difftool -y origin";
          f = "fetch";
          gcfg = "config --global";
          l = "log --reverse";
          lr = "log";
          pl = "pull";
          plr = "pull --rebase";
          ps = "push";
          psu = "push -u";
          psf = "push -f";
          rb = "rebase";
          rba = "rebase --abort";
          rbc = "rebase --continue";
          rbi = "rebase -i --committer-date-is-author-date";
          rbir = "rebase -i --root --committer-date-is-author-date";
          rem = "remote";
          rema = "remote add";
          remr = "remote remove";
          rmc = "rm --cache";
          rs = "reset";
          rsh = "reset --hard";
          st = "status";
          sw = "switch";
        };
      };
    };
    bash = {
      enable = true;
      shellAliases = {
        "cl" = "clear";
        "em" = "$EDITOR";
        "g" = "git";
        "ll" = "ls -l";
        "ls" = "ls -a -F --color=auto";

        ".." = "cd ..";
        "." = "ls";
      };
    };
    vim = {
      enable = true;
      defaultEditor = true;
      settings = {
        "number" = true;
        "relativenumber" = true;
        "mouse" = "a";
        "expandtab" = true;
      };
    };
  };

  home.packages = with pkgs; [ ];
}
