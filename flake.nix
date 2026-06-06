{
  description = "My collection of flake templates";

  outputs =
    { self }:
    {
      templates = {
        ocaml = {
          path = ./ocaml;
          description = "Python development template";
        };

        sail = {
          path = ./sail;
          description = "Python development template";
        };

        zig = {
          path = ./zig;
          description = "Python development template";
        };

        blank = {
          path = ./blank;
          description = "A blank template to start from";
        };

        rust = {
          path = ./rust;
          description = "Rust development template";
        };

        # optional: default template
        defaultTemplate = self.templates.blank;
      };
    };
}
