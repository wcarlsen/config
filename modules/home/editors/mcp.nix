{
  programs.mcp = {
    enable = true;
    servers = {
      opentofu = {
        type = "sse";
        url = "https://mcp.opentofu.org/sse";
      };
      nixos = {
        command = "podman";
        args = [
          "run"
          "--rm"
          "-i"
          "ghcr.io/utensils/mcp-nixos"
        ];
      };
    };
  };
}
