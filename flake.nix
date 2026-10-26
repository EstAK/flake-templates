{
  description = "My collection of flake templates";

  outputs =
    { self }:
    {
      templates = {
        blank = {
          path = ./blank;
          description = "A blank template to start from";
        };
        ocaml = {
          path = ./ocaml;
          description = "Ocaml development template";
        };

        sail = {
          path = ./sail;
          description = "Sail development template";
        };

        zig = {
          path = ./zig;
          description = "Zig development template";
        };
        rust = {
          path = ./rust;
          description = "Rust development template";
        };
        sched_ext = {
          path = ./sched_ext;
          description = "Rust sched_ext development template";
        };
        typst = {
          path = ./typst;
          description = "Typst writing template";
        };
        python = {
          path = ./python;
          description = "Python development template";
        };
        c = {
          path = ./c;
          description = "C development template";
        };

	build_rpi5_kernel = {
          path = ./build_rpi5_kernel;
          description = "Build the rpi5 kernel environment";
        };

      };
    };
}
