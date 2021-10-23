{ config, pkgs, ... }:

with pkgs;
let
  url = "https://cdn.star.nesdis.noaa.gov/GOES16/ABI/CONUS/GEOCOLOR/latest.jpg";
  outputPath = "/data/2.media/2.photos/4.backgrounds/goes-16.jpg";
in {
  systemd.services.goes-16 = {
    description = "GOES-16 photo updater";

    script = ''
      mkdir -p /tmp/goes-16 && cd /tmp/goes-16 || exit 1

      code=$(${wget}/bin/wget -N -T 15 ${url} 2>&1 \
             | ${gawk}/bin/awk '/^HTTP request sent/ {print $6}')

      if [[ $code == 200 || ! -e ${outputPath} ]]; then
        text=$(date -r /tmp/goes-16/latest.jpg '+(Photo updated: %F %H%M%z)')

        ${imagemagick}/bin/convert /tmp/goes-16/latest.jpg \
          -resize '3840x2160^' -gravity north -crop 3840x2160+0+0 +repage \
          -font 'Fira-Sans-Medium' -pointsize 64 \
            -fill white -stroke black -strokewidth 8 -annotate +0+128 "$text" \
            -stroke white -strokewidth 1 -annotate +0+128 "$text" \
          ${outputPath}
      fi
    '';
  };

  systemd.timers.goes-16 = {
    description = "Timer for GOES-16 photo updater";
    partOf = [ "goes-16.service" ];

    timerConfig.OnCalendar = "*:0/1";

    after = [ "network-online.target" ];
    wantedBy = [ "timers.target" ];
  };
}
