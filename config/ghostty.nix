{
  inputs,
  config,
  ...
}: {
  programs.ghostty = {
    enable = true;
    # package = inputs.ghostty.packages.${system}.default;
    # shellIntegration.enable = true;

    settings = {
      font-family = "Berkeley Mono";
      theme = "rose-pine";
      window-vsync = "false";
      window-decoration = "false";
      window-save-state = "never";
      confirm-close-surface = "false";

      clipboard-read = "allow";
      clipboard-write = "allow";
      clipboard-trim-trailing-spaces = "true";
      clipboard-paste-protection = "true";

      shell-integration = "bash";

      desktop-notifications = "true";
    };
  };
}

