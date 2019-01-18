configuration graphics_structure_cfg of graphics is
   for structure
      for all: vga_controller use configuration work.vga_controller_structure_cfg;
      end for;
      for all: image_gen use configuration work.image_gen_structure_cfg;
      end for;
   end for;
end graphics_structure_cfg;
