{ pkgs, ... }:
{
  home.packages = with pkgs; [
    aspellDicts.en
    aspellDicts.sv
    hunspellDicts.sv_SE
    hunspellDicts.en_US
    ibus                                                # Support for CJK language input.
    ibus-engines.libpinyin
    libpinyin
  ];
}
