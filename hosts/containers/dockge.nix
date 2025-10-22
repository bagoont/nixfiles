{
  virtualisation.oci-containers.containers = {
    "dockge" = {
      image = "louislam/dockge:1";
      environment = {
        DOCKGE_STACKS_DIR = "/opt/stacks";
      };
      volumes = [
        "dockge-data:/app/data"
        "/opt/stacks:/opt/stacks"
        "/var/run/docker.sock:/var/run/docker.sock"
      ];
      ports = [
        "5001:5001/tcp"
      ];
      networks = [
        "dockge"
      ];
    };
  };
}
