{ lib, fetchFromGitHub, buildLua, mpv-unwrapped }:

buildLua {
  pname = "mpv-thumbfast";
  version = "unstable-2023-06-04";

  src = fetchFromGitHub {
    owner = "po5";
    repo = "thumbfast";
    rev = "6f1d92da25a7b807427f55f085e7ad4d60c4e0d7";
    hash = "sha256-7CCxMPmZZRDIcWn+YbV4xzZFL80qZS5UFA25E+Y2P2Q=";
  };

  postPatch = ''
    substituteInPlace thumbfast.lua \
      --replace 'mpv_path = "mpv"' 'mpv_path = "${lib.getExe mpv-unwrapped}"'
  '';

  scriptPath = "thumbfast.lua";

  meta = {
    description = "High-performance on-the-fly thumbnailer for mpv";
    homepage = "https://github.com/po5/thumbfast";
    license = lib.licenses.mpl20;
    maintainers = with lib.maintainers; [ apfelkuchen6 ];
  };
}
