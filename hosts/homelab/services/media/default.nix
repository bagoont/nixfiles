{lib, ...}: {
  imports = [
    ./jellyfin.nix
    ./qbittorrent.nix
  ];

  users.groups."media" = {};

  systemd.tmpfiles.rules = let
    base = "/media";
    categories = ["books" "movies" "music" "tv"];
  in
    [
      "d ${base} 0755 root root - -"
      "d ${base}/data 0770 root media - -"
      "d ${base}/torrents 0770 root media - -"
    ]
    ++ map (cat: "d ${base}/data/${cat} 0770 root media - -") categories
    ++ map (cat: "d ${base}/torrents/${cat} 0770 root media - -") categories;
}
