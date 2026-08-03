{
  services.ollama = {
    enable = true;
    # Optional: preload models, see https://ollama.com/library
    loadModels = ["qwen3.5:latest"];
  };
  services.open-webui.enable = false; # accesible at 127.0.0.1:8080
}
