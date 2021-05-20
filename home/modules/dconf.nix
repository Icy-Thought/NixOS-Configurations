# Generated via dconf2nix: https://github.com/gvolpe/dconf2nix
{ lib, ... }:

let
  mkTuple = lib.hm.gvariant.mkTuple;
in
{
  dconf.settings = {
    "ca/desrt/dconf-editor" = {
      saved-pathbar-path = "/org/gnome/desktop/applications/office/";
      saved-view = "/org/gnome/desktop/applications/office/";
    };

    "com/github/johnfactotum/Foliate/view" = {
      bg-color = "#282828";
      fg-color = "#ebdbb2";
      invert = false;
      layout = "auto";
      link-color = "#83a598";
      prefer-dark-theme = true;
    };

    "com/github/libpinyin/ibus-libpinyin/libpinyin" = {
      network-dictionary-end-timestamp = "int64 1600522231";
      network-dictionary-start-timestamp = "int64 1600522231";
    };

    "io/github/celluloid-player/celluloid" = {
      settings-migrated = true;
    };

    "io/github/celluloid-player/celluloid/window-state" = {
      loop-playlist = false;
      playlist-width = 250;
      show-controls = true;
      show-playlist = false;
      volume = 1.0;
    };

    "org/gnome/Geary" = {
      ask-open-attachment = true;
      compose-as-html = true;
      folder-list-pane-position-horizontal = 174;
      formatting-toolbar-visible = false;
      messages-pane-position = 451;
      migrated-config = true;
      optional-plugins = [ "sent-sound" ];
      startup-notifications = true;
      window-height = 843;
      window-width = 1450;
    };

    "org/gnome/boxes" = {
      first-run = false;
      view = "icon-view";
    };

    "org/gnome/clocks" = {
      world-clocks = ""[{'location': <(uint32 2, <('Shenzhen', 'ZGSZ', true, [(0.39357174632472131, 1.9914206765255298)], [(0.39328085229829141, 1.9920024471250972)])>)>}]"";
    };

    "org/gnome/control-center" = {
      last-panel = "keyboard";
    };

    "org/gnome/desktop/applications/terminal" = {
      exec = "alacritty";
    };

    "org/gnome/desktop/background" = {
      picture-uri = "file:///home/sirius/Pictures/Wallpapers/Desktop/joseph-barrientos-Ji_G7Bu1MoM-unsplash.jpg";
    };

    "org/gnome/desktop/calendar" = {
      show-weekdate = true;
    };

    "org/gnome/desktop/input-sources" = {
      mru-sources = [ (mkTuple [ "xkb" "us" ]) (mkTuple [ "xkb" "se" ]) (mkTuple [ "xkb" "ara" ]) ];
      per-window = true;
      sources = [ (mkTuple [ "xkb" "us" ]) (mkTuple [ "xkb" "se" ]) (mkTuple [ "xkb" "ara" ]) (mkTuple [ "ibus" "libpinyin" ]) ];
      xkb-options = [ "lv3:ralt_switch" ];
    };

    "org/gnome/desktop/interface" = {
      clock-show-seconds = true;
      clock-show-weekday = true;
      font-antialiasing = "grayscale";
      font-hinting = "slight";
      gtk-im-module = "ibus";
      monospace-font-name = "Iosevka Semi-Bold 12";
      show-battery-percentage = true;
    };

    "org/gnome/desktop/media-handling" = {
      autorun-x-content-ignore = "@as []";
      autorun-x-content-open-folder = "@as []";
      autorun-x-content-start-app = [ "x-content/unix-software" "x-content/ostree-repository" "x-content/audio-player" "x-content/image-dcf" "x-content/video-dvd" "x-content/audio-cdda" ];
    };

    "org/gnome/desktop/notifications" = {
      application-children = [ "org-gnome-nautilus" "steam" ];
    };

    "org/gnome/desktop/notifications/application/org-gnome-nautilus" = {
      application-id = "org.gnome.Nautilus.desktop";
    };

    "org/gnome/desktop/notifications/application/steam" = {
      application-id = "steam.desktop";
    };

    "org/gnome/desktop/peripherals/keyboard" = {
      numlock-state = true;
    };

    "org/gnome/desktop/peripherals/touchpad" = {
      natural-scroll = true;
      speed = 0.610294;
      tap-to-click = true;
      two-finger-scrolling-enabled = true;
    };

    "org/gnome/desktop/privacy" = {
      disable-camera = false;
      disable-microphone = false;
      recent-files-max-age = 30;
      remove-old-temp-files = true;
      remove-old-trash-files = true;
    };

    "org/gnome/desktop/screensaver" = {
      picture-uri = "file:///home/sirius/Pictures/Wallpapers/Desktop/joseph-barrientos-Ji_G7Bu1MoM-unsplash.jpg";
    };

    "org/gnome/desktop/session" = {
      idle-delay = "uint32 300";
    };

    "org/gnome/desktop/sound" = {
      allow-volume-above-100-percent = false;
    };

    "org/gnome/desktop/wm/preferences" = {
      button-layout = "appmenu:minimize,maximize,close";
      workspace-names = "@as []";
    };

    "org/gnome/eog/view" = {
      background-color = "rgb(0,0,0)";
      use-background-color = true;
    };

    "org/gnome/epiphany" = {
      ask-for-default = false;
      default-search-engine = "DuckDuckGo";
    };

    "org/gnome/epiphany/reader" = {
      color-scheme = "dark";
    };

    "org/gnome/epiphany/web" = {
      default-zoom-level = 1.0;
    };

    "org/gnome/evolution-data-server" = {
      migrated = true;
      network-monitor-gio-name = "";
    };

    "org/gnome/file-roller/listing" = {
      list-mode = "as-folder";
      name-column-width = 268;
      show-path = false;
      sort-method = "name";
      sort-type = "ascending";
    };

    "org/gnome/gedit/plugins" = {
      active-plugins = [ "filebrowser" "docinfo" "modelines" "sort" "spell" ];
    };

    "org/gnome/gedit/plugins/filebrowser" = {
      root = "file:///";
      tree-view = true;
      virtual-root = "file:///run/media/sirius/be3de744-67f5-49ac-911f-a20b347fdafb/Backups/Arch-Linux-20210519/Backup/Desktop";
    };

    "org/gnome/gedit/preferences/ui" = {
      show-tabs-mode = "auto";
    };

    "org/gnome/gedit/state/window" = {
      bottom-panel-size = 140;
      side-panel-active-page = "GeditWindowDocumentsPanel";
      side-panel-size = 200;
      size = mkTuple [ 900 700 ];
      state = 87168;
    };

    "org/gnome/gnome-screenshot" = {
      auto-save-directory = "file:///home/sirius/Pictures/Screenshots";
    };

    "org/gnome/maps" = {
      hybrid-aerial = true;
      map-type = "MapsAerialSource";
      night-mode = true;
      transportation-type = "pedestrian";
      window-maximized = true;
    };

    "org/gnome/mutter" = {
      attach-modal-dialogs = true;
      dynamic-workspaces = true;
      edge-tiling = true;
      focus-change-on-pointer-rest = true;
      workspaces-only-on-primary = true;
    };

    "org/gnome/nautilus/preferences" = {
      default-folder-viewer = "icon-view";
      search-filter-time-type = "last_modified";
      search-view = "list-view";
      show-create-link = false;
    };

    "org/gnome/nautilus/window-state" = {
      initial-size = mkTuple [ 1125 646 ];
      maximized = false;
    };

    "org/gnome/settings-daemon/plugins/media-keys" = {
      area-screenshot = [ "@as []" ];
      custom-keybindings = [ "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/" "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/" "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/" ];
      screenshot = [ "@as []" ];
      window-screenshot = [ "@as []" ];
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      binding = "<Shift>Print";
      command = "gnome-screenshot -a";
      name = "Screenshot Selected Area";
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
      binding = "<Alt>Print";
      command = "gnome-screenshot -w";
      name = "Screenshot Active Application Window";
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2" = {
      binding = "Print";
      command = "gnome-screenshot";
      name = "Screenshot Display";
    };

    "org/gnome/settings-daemon/plugins/power" = {
      sleep-inactive-ac-type = "nothing";
      sleep-inactive-battery-type = "suspend";
    };

    "org/gnome/shell" = {
      app-picker-layout = "[{'org.gnome.Contacts.desktop': <{'position': <0>}>, 'org.gnome.Weather.desktop': <{'position': <1>}>, 'org.gnome.clocks.desktop': <{'position': <2>}>, 'org.gnome.Maps.desktop': <{'position': <3>}>, 'org.gnome.Photos.desktop': <{'position': <4>}>, 'org.gnome.Totem.desktop': <{'position': <5>}>, 'org.gnome.Calculator.desktop': <{'position': <6>}>, 'org.gnome.gedit.desktop': <{'position': <7>}>, 'simple-scan.desktop': <{'position': <8>}>, 'gnome-control-center.desktop': <{'position': <9>}>, 'gnome-system-monitor.desktop': <{'position': <10>}>, 'org.gnome.Boxes.desktop': <{'position': <11>}>, 'org.gnome.Terminal.desktop': <{'position': <12>}>, 'anki.desktop': <{'position': <13>}>, 'org.gnome.Characters.desktop': <{'position': <14>}>, 'org.gnome.FileRoller.desktop': <{'position': <15>}>, 'yelp.desktop': <{'position': <16>}>, 'org.gnome.Screenshot.desktop': <{'position': <17>}>, 'blender.desktop': <{'position': <18>}>, 'org.gnome.Cheese.desktop': <{'position': <19>}>, 'org.gnome.font-viewer.desktop': <{'position': <20>}>, 'brave-browser.desktop': <{'position': <21>}>, 'org.gnome.Calendar.desktop': <{'position': <22>}>, 'io.github.celluloid_player.Celluloid.desktop': <{'position': <23>}>}, {'org.gnome.Connections.desktop': <{'position': <0>}>, 'org.gnome.baobab.desktop': <{'position': <1>}>, 'org.gnome.DiskUtility.desktop': <{'position': <2>}>, 'org.gnome.Evince.desktop': <{'position': <3>}>, 'easytag.desktop': <{'position': <4>}>, 'org.gnome.Extensions.desktop': <{'position': <5>}>, 'firefox.desktop': <{'position': <6>}>, 'fish.desktop': <{'position': <7>}>, 'com.github.johnfactotum.Foliate.desktop': <{'position': <8>}>, 'freetube.desktop': <{'position': <9>}>, 'gimp.desktop': <{'position': <10>}>, 'htop.desktop': <{'position': <11>}>, 'org.gnome.eog.desktop': <{'position': <12>}>, 'org.inkscape.Inkscape.desktop': <{'position': <13>}>, 'startcenter.desktop': <{'position': <14>}>, 'base.desktop': <{'position': <15>}>, 'calc.desktop': <{'position': <16>}>, 'draw.desktop': <{'position': <17>}>, 'impress.desktop': <{'position': <18>}>, 'math.desktop': <{'position': <19>}>, 'writer.desktop': <{'position': <20>}>, 'org.gnome.Logs.desktop': <{'position': <21>}>, 'net.lutris.Lutris.desktop': <{'position': <22>}>, 'cups.desktop': <{'position': <23>}>}, {'mpv.desktop': <{'position': <0>}>, 'org.gnome.Music.desktop': <{'position': <1>}>, 'nixos-manual.desktop': <{'position': <2>}>, 'com.obsproject.Studio.desktop': <{'position': <3>}>, 'osu.desktop': <{'position': <4>}>, 'org.gnome.seahorse.Application.desktop': <{'position': <5>}>, 'org.gnome.Polari.desktop': <{'position': <6>}>, 'signal-desktop.desktop': <{'position': <7>}>, 'steam.desktop': <{'position': <8>}>, 'telegramdesktop.desktop': <{'position': <9>}>, 'org.gnome.Tour.desktop': <{'position': <10>}>, 'transmission-gtk.desktop': <{'position': <11>}>, 'org.gnome.tweaks.desktop': <{'position': <12>}>, 'umpv.desktop': <{'position': <13>}>, 'org.gnome.Epiphany.desktop': <{'position': <14>}>, 'winetricks.desktop': <{'position': <15>}>, 'nvim.desktop': <{'position': <16>}>, 'xterm.desktop': <{'position': <17>}>, 'org.pwmt.zathura.desktop': <{'position': <18>}>, 'Zoom.desktop': <{'position': <19>}>}]";
      disable-user-extensions = false;
      favorite-apps = [ "org.gnome.Nautilus.desktop" "org.gnome.Fractal.desktop" "discord.desktop" "org.gnome.Geary.desktop" "emacs.desktop" "Alacritty.desktop" "qalculate-gtk.desktop" ];
      welcome-dialog-last-shown-version = "40.1";
    };

    "org/gnome/shell/weather" = {
      automatic-location = true;
    };

    "org/gnome/shell/world-clocks" = {
      locations = "@av []";
    };

    "org/gnome/terminal/legacy/profiles:" = {
      default = "3ccfc57a-67ca-4e54-bf71-030af000fc48";
      list = [ "b1dcc9dd-5262-4d8d-a863-c897e6d979b9" "3ccfc57a-67ca-4e54-bf71-030af000fc48" ];
    };

    "org/gnome/terminal/legacy/profiles:/:3ccfc57a-67ca-4e54-bf71-030af000fc48" = {
      allow-bold = true;
      background-color = "#1E1E21212727";
      bold-color = "#5C5C63637070";
      bold-color-same-as-fg = true;
      cursor-background-color = "#5C5C63637070";
      cursor-colors-set = true;
      cursor-foreground-color = "#1E1E21212727";
      default-size-columns = 118;
      default-size-rows = 27;
      font = "JetBrainsMonoMedium Nerd Font Medium 12";
      foreground-color = "#5C5C63637070";
      palette = [ "#000000000000" "#E0E06C6C7575" "#9898C3C37979" "#D1D19A9A6666" "#6161AFAFEFEF" "#C6C67878DDDD" "#5656B6B6C2C2" "#ABABB2B2BFBF" "#5C5C63637070" "#E0E06C6C7575" "#9898C3C37979" "#D1D19A9A6666" "#6161AFAFEFEF" "#C6C67878DDDD" "#5656B6B6C2C2" "#FFFFFEFEFEFE" ];
      scrollbar-policy = "never";
      use-system-font = true;
      use-theme-background = false;
      use-theme-colors = false;
      use-theme-transparency = false;
      visible-name = "One Dark";
    };

    "org/gnome/tweaks" = {
      show-extensions-notice = false;
    };

    "org/gtk/settings/file-chooser" = {
      date-format = "regular";
      location-mode = "path-bar";
      show-hidden = false;
      show-size-column = true;
      show-type-column = true;
      sidebar-width = 170;
      sort-column = "name";
      sort-directories-first = true;
      sort-order = "ascending";
      type-format = "category";
      window-position = mkTuple [ 26 23 ];
      window-size = mkTuple [ 1231 902 ];
    };

    "system/locale" = {
      region = "sv_SE.UTF-8";
    };

  };
}
