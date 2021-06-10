{ lib
  , stdenv
  , stdenvNoCC
  , fetchFromGitHub
  , sassc
  , gtk3
  , gnome
  , gnome-icon-theme
  , hicolor-icon-theme
}:

stdenv.mkDerivation rec {
  pname = "whitesur-icon-theme";
  version = "2021-05-20";

  src = fetchFromGitHub {
    owner = "vinceliuice";
    repo = pname;
    rev = "5c44b318d33a3c3dc43bfee0749f3ce0a8fe6529";
    sha256 = "1ch3hp08qri93510hypzz6m2x4xgg2h15wvnhjwh1x1s1b7jvxjd";
  };

  nativeBuildInputs = [
    gtk3
    sassc
  ];

  propagatedBuildInputs = [
    gnome.adwaita-icon-theme
    gnome-icon-theme
    hicolor-icon-theme
  ];

  dontDropIconThemeCache = true;

  postPatch = ''
    patchShebangs .
  '';

  postInstall = ''
    gtk-update-icon-cache "$out"/share/icons/WhiteSur-dark;
  '';

  meta = with lib; {
    description = "MacOS Big Sur style icon theme for linux desktops";
    homepage = "https://github.com/vinceliuice/WhiteSur-icon-theme";
    license = licenses.gpl3;
    platforms = platforms.linux;
    maintainers = with maintainers; [ maintainers.icy-thought ];
  };

}
