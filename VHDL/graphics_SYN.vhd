
library ieee;
use ieee.std_logic_1164.all;
--library tcb018gbwp7t;
--use tcb018gbwp7t.all;

architecture synthesised of graphics is

  component ND2D4BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  component IND2D1BWP7T
    port(A1, B1 : in std_logic; ZN : out std_logic);
  end component;

  component OR2D4BWP7T
    port(A1, A2 : in std_logic; Z : out std_logic);
  end component;

  component OAI31D0BWP7T
    port(A1, A2, A3, B : in std_logic; ZN : out std_logic);
  end component;

  component AO21D0BWP7T
    port(A1, A2, B : in std_logic; Z : out std_logic);
  end component;

  component ND2D0BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  component NR2D1BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  component CKND2D1BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  component ND2D1BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  component INR2D1BWP7T
    port(A1, B1 : in std_logic; ZN : out std_logic);
  end component;

  component AO221D0BWP7T
    port(A1, A2, B1, B2, C : in std_logic; Z : out std_logic);
  end component;

  component AO211D0BWP7T
    port(A1, A2, B, C : in std_logic; Z : out std_logic);
  end component;

  component INR3D0BWP7T
    port(A1, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component AO32D1BWP7T
    port(A1, A2, A3, B1, B2 : in std_logic; Z : out std_logic);
  end component;

  component AO22D0BWP7T
    port(A1, A2, B1, B2 : in std_logic; Z : out std_logic);
  end component;

  component OA21D0BWP7T
    port(A1, A2, B : in std_logic; Z : out std_logic);
  end component;

  component AOI21D0BWP7T
    port(A1, A2, B : in std_logic; ZN : out std_logic);
  end component;

  component AOI211XD0BWP7T
    port(A1, A2, B, C : in std_logic; ZN : out std_logic);
  end component;

  component IAO21D0BWP7T
    port(A1, A2, B : in std_logic; ZN : out std_logic);
  end component;

  component INVD0BWP7T
    port(I : in std_logic; ZN : out std_logic);
  end component;

  component CKXOR2D4BWP7T
    port(A1, A2 : in std_logic; Z : out std_logic);
  end component;

  component DFD1BWP7T
    port(CP, D : in std_logic; Q, QN : out std_logic);
  end component;

  component DFKCND1BWP7T
    port(CP, CN, D : in std_logic; Q, QN : out std_logic);
  end component;

  component OAI221D0BWP7T
    port(A1, A2, B1, B2, C : in std_logic; ZN : out std_logic);
  end component;

  component NR4D0BWP7T
    port(A1, A2, A3, A4 : in std_logic; ZN : out std_logic);
  end component;

  component OAI32D1BWP7T
    port(A1, A2, A3, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component IND4D0BWP7T
    port(A1, B1, B2, B3 : in std_logic; ZN : out std_logic);
  end component;

  component OAI211D1BWP7T
    port(A1, A2, B, C : in std_logic; ZN : out std_logic);
  end component;

  component ND4D0BWP7T
    port(A1, A2, A3, A4 : in std_logic; ZN : out std_logic);
  end component;

  component AOI22D0BWP7T
    port(A1, A2, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component MAOI22D0BWP7T
    port(A1, A2, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component INR2XD0BWP7T
    port(A1, B1 : in std_logic; ZN : out std_logic);
  end component;

  component NR2XD0BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  component OAI21D0BWP7T
    port(A1, A2, B : in std_logic; ZN : out std_logic);
  end component;

  component OA32D1BWP7T
    port(A1, A2, A3, B1, B2 : in std_logic; Z : out std_logic);
  end component;

  component MOAI22D0BWP7T
    port(A1, A2, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component CKND1BWP7T
    port(I : in std_logic; ZN : out std_logic);
  end component;

  component AN2D0BWP7T
    port(A1, A2 : in std_logic; Z : out std_logic);
  end component;

  component AOI221D0BWP7T
    port(A1, A2, B1, B2, C : in std_logic; ZN : out std_logic);
  end component;

  component NR2D0BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  component HA1D0BWP7T
    port(A, B : in std_logic; CO, S : out std_logic);
  end component;

  component AOI211D1BWP7T
    port(A1, A2, B, C : in std_logic; ZN : out std_logic);
  end component;

  component OR2D1BWP7T
    port(A1, A2 : in std_logic; Z : out std_logic);
  end component;

  component AOI222D0BWP7T
    port(A1, A2, B1, B2, C1, C2 : in std_logic; ZN : out std_logic);
  end component;

  component IND3D1BWP7T
    port(A1, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component CKAN2D1BWP7T
    port(A1, A2 : in std_logic; Z : out std_logic);
  end component;

  component ND3D0BWP7T
    port(A1, A2, A3 : in std_logic; ZN : out std_logic);
  end component;

  component OAI22D0BWP7T
    port(A1, A2, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component FA1D0BWP7T
    port(A, B, CI : in std_logic; CO, S : out std_logic);
  end component;

  component CKND2D0BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  component AOI31D0BWP7T
    port(A1, A2, A3, B : in std_logic; ZN : out std_logic);
  end component;

  component MAOI222D1BWP7T
    port(A, B, C : in std_logic; ZN : out std_logic);
  end component;

  component INVD1BWP7T
    port(I : in std_logic; ZN : out std_logic);
  end component;

  component DFKCNQD1BWP7T
    port(CP, CN, D : in std_logic; Q : out std_logic);
  end component;

  component AN4D0BWP7T
    port(A1, A2, A3, A4 : in std_logic; Z : out std_logic);
  end component;

  component CKXOR2D1BWP7T
    port(A1, A2 : in std_logic; Z : out std_logic);
  end component;

  component AN2D1BWP7T
    port(A1, A2 : in std_logic; Z : out std_logic);
  end component;

  component DFQD1BWP7T
    port(CP, D : in std_logic; Q : out std_logic);
  end component;

  component NR3D0BWP7T
    port(A1, A2, A3 : in std_logic; ZN : out std_logic);
  end component;

  component INR4D0BWP7T
    port(A1, B1, B2, B3 : in std_logic; ZN : out std_logic);
  end component;

  component OR3D4BWP7T
    port(A1, A2, A3 : in std_logic; Z : out std_logic);
  end component;

  component CKAN2D4BWP7T
    port(A1, A2 : in std_logic; Z : out std_logic);
  end component;

  component IINR4D0BWP7T
    port(A1, A2, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component IOA21D1BWP7T
    port(A1, A2, B : in std_logic; ZN : out std_logic);
  end component;

  component IIND4D0BWP7T
    port(A1, A2, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component AN4D1BWP7T
    port(A1, A2, A3, A4 : in std_logic; Z : out std_logic);
  end component;

  component AN3D0BWP7T
    port(A1, A2, A3 : in std_logic; Z : out std_logic);
  end component;

  component AN2D4BWP7T
    port(A1, A2 : in std_logic; Z : out std_logic);
  end component;

  component IOA21D0BWP7T
    port(A1, A2, B : in std_logic; ZN : out std_logic);
  end component;

  signal image_rgb_state : std_logic_vector(2 downto 0);
  signal image_item_type_inter : std_logic_vector(1 downto 0);
  signal image_color_cnt_inter : std_logic_vector(6 downto 0);
  signal h_count : std_logic_vector(8 downto 0);
  signal v_count : std_logic_vector(9 downto 0);
  signal image_cnt_60hz_color_cnt_in : std_logic_vector(9 downto 0);
  signal vga_ctrl_h_ctrl_state : std_logic_vector(2 downto 0);
  signal vga_ctrl_v_ctrl_state : std_logic_vector(2 downto 0);
  signal image_snake_state : std_logic_vector(1 downto 0);
  signal image_cnt_60hz_n_0, image_cnt_60hz_n_1, image_cnt_60hz_n_2, image_cnt_60hz_n_3, image_cnt_60hz_n_4 : std_logic;
  signal image_cnt_60hz_n_6, image_cnt_60hz_n_11, image_cnt_60hz_n_34, image_cnt_60hz_n_35, image_cnt_60hz_n_36 : std_logic;
  signal image_cnt_60hz_n_37, image_cnt_60hz_n_38, image_cnt_60hz_n_39, image_cnt_60hz_n_41, image_cnt_60hz_n_42 : std_logic;
  signal image_cnt_60hz_n_43, image_cnt_60hz_n_44, image_cnt_60hz_n_45, image_cnt_60hz_n_46, image_cnt_60hz_n_47 : std_logic;
  signal image_cnt_60hz_n_48, image_cnt_60hz_n_49, image_cnt_60hz_n_50, image_cnt_60hz_n_51, image_cnt_60hz_n_52 : std_logic;
  signal image_cnt_60hz_n_53, image_flick_enable, image_item_inter, image_item_n_0, image_item_n_1 : std_logic;
  signal image_item_n_58, image_item_n_60, image_item_n_81, image_item_n_88, image_item_n_107 : std_logic;
  signal image_item_n_114, image_item_n_161, image_item_n_162, image_item_n_175, image_item_n_188 : std_logic;
  signal image_item_n_201, image_item_n_204, image_item_n_205, image_item_n_206, image_item_n_207 : std_logic;
  signal image_item_n_208, image_item_n_209, image_item_n_210, image_item_n_211, image_item_n_212 : std_logic;
  signal image_item_n_213, image_item_n_214, image_item_n_215, image_item_n_216, image_item_n_217 : std_logic;
  signal image_item_n_218, image_item_n_219, image_item_n_220, image_item_n_221, image_item_n_222 : std_logic;
  signal image_item_n_223, image_item_n_224, image_item_n_225, image_item_n_226, image_item_n_227 : std_logic;
  signal image_item_n_228, image_item_n_229, image_item_n_230, image_item_n_231, image_item_n_232 : std_logic;
  signal image_item_n_233, image_item_n_234, image_item_n_235, image_item_n_236, image_item_n_237 : std_logic;
  signal image_item_n_238, image_item_n_239, image_item_n_240, image_item_n_241, image_item_n_242 : std_logic;
  signal image_item_n_243, image_item_n_244, image_item_n_250, image_item_n_251, image_item_n_252 : std_logic;
  signal image_item_n_253, image_item_n_254, image_item_n_255, image_item_n_256, image_item_n_257 : std_logic;
  signal image_item_n_258, image_item_n_259, image_item_n_260, image_item_n_261, image_item_n_262 : std_logic;
  signal image_item_n_263, image_item_n_264, image_item_n_265, image_item_n_266, image_item_n_267 : std_logic;
  signal image_item_n_268, image_item_n_269, image_item_n_270, image_item_n_271, image_item_n_272 : std_logic;
  signal image_item_n_273, image_item_n_274, image_item_n_275, image_item_n_276, image_item_n_277 : std_logic;
  signal image_item_n_278, image_item_n_279, image_item_n_280, image_item_n_281, image_item_n_282 : std_logic;
  signal image_item_n_283, image_item_n_284, image_item_n_285, image_item_n_286, image_item_n_287 : std_logic;
  signal image_item_n_288, image_item_n_289, image_item_n_290, image_item_n_291, image_item_n_292 : std_logic;
  signal image_item_n_293, image_item_n_294, image_item_n_295, image_item_n_296, image_item_n_297 : std_logic;
  signal image_item_n_298, image_item_n_299, image_item_n_300, image_item_n_301, image_item_n_302 : std_logic;
  signal image_item_n_303, image_item_n_304, image_item_n_305, image_item_n_306, image_item_n_307 : std_logic;
  signal image_item_n_308, image_item_n_309, image_item_n_310, image_item_n_311, image_item_n_312 : std_logic;
  signal image_item_n_313, image_item_n_314, image_item_n_315, image_item_n_316, image_item_n_317 : std_logic;
  signal image_item_n_318, image_item_n_319, image_item_n_320, image_item_n_321, image_item_n_322 : std_logic;
  signal image_item_n_323, image_item_n_324, image_item_n_325, image_item_n_326, image_item_n_327 : std_logic;
  signal image_item_n_328, image_item_n_329, image_item_n_330, image_item_n_331, image_item_n_332 : std_logic;
  signal image_item_n_333, image_item_n_334, image_item_n_335, image_item_n_336, image_item_n_337 : std_logic;
  signal image_item_n_338, image_item_n_339, image_item_n_340, image_item_n_341, image_item_n_342 : std_logic;
  signal image_item_n_343, image_item_n_344, image_item_n_345, image_item_n_346, image_item_n_347 : std_logic;
  signal image_item_n_348, image_item_n_349, image_item_n_350, image_item_n_351, image_item_n_352 : std_logic;
  signal image_item_n_353, image_item_n_354, image_item_n_355, image_item_n_356, image_item_n_357 : std_logic;
  signal image_item_n_358, image_item_n_359, image_item_n_360, image_item_n_361, image_item_n_362 : std_logic;
  signal image_item_n_363, image_item_n_364, image_item_n_365, image_item_n_366, image_item_n_367 : std_logic;
  signal image_item_n_368, image_item_n_369, image_item_n_370, image_item_n_371, image_item_n_372 : std_logic;
  signal image_item_n_373, image_item_n_374, image_item_n_375, image_item_n_376, image_item_n_377 : std_logic;
  signal image_item_n_378, image_item_n_379, image_item_n_380, image_item_n_381, image_item_n_382 : std_logic;
  signal image_item_n_383, image_item_n_384, image_item_n_385, image_item_n_386, image_item_n_387 : std_logic;
  signal image_item_n_388, image_item_n_389, image_item_n_390, image_item_n_391, image_item_n_392 : std_logic;
  signal image_item_n_393, image_rgb_n_8, image_rgb_n_10, image_rgb_n_22, image_rgb_n_25 : std_logic;
  signal image_rgb_n_29, image_rgb_n_43, image_rgb_n_44, image_rgb_n_45, image_rgb_n_46 : std_logic;
  signal image_rgb_n_47, image_rgb_n_48, image_rgb_n_49, image_rgb_n_50, image_rgb_n_51 : std_logic;
  signal image_rgb_n_52, image_rgb_n_53, image_rgb_n_54, image_rgb_n_55, image_rgb_n_56 : std_logic;
  signal image_rgb_n_57, image_rgb_n_58, image_rgb_n_59, image_rgb_n_60, image_rgb_n_61 : std_logic;
  signal image_rgb_n_62, image_rgb_n_63, image_rgb_n_64, image_rgb_n_65, image_rgb_n_66 : std_logic;
  signal image_rgb_n_67, image_rgb_n_70, image_rgb_n_71, image_rgb_n_72, image_rgb_n_89 : std_logic;
  signal image_rgb_n_90, image_rgb_n_91, image_rgb_n_93, image_snake_inter, image_snake_n_0 : std_logic;
  signal image_snake_n_2, image_snake_n_15, image_snake_n_22, image_snake_n_46, image_snake_n_51 : std_logic;
  signal image_snake_n_130, image_snake_n_167, image_snake_n_176, image_snake_n_180, image_snake_n_181 : std_logic;
  signal image_snake_n_182, image_snake_n_183, image_snake_n_184, image_snake_n_185, image_snake_n_186 : std_logic;
  signal image_snake_n_187, image_snake_n_188, image_snake_n_189, image_snake_n_190, image_snake_n_191 : std_logic;
  signal image_snake_n_192, image_snake_n_193, image_snake_n_194, image_snake_n_195, image_snake_n_196 : std_logic;
  signal image_snake_n_197, image_snake_n_198, image_snake_n_199, image_snake_n_200, image_snake_n_201 : std_logic;
  signal image_snake_n_202, image_snake_n_203, image_snake_n_204, image_snake_n_205, image_snake_n_206 : std_logic;
  signal image_snake_n_207, image_snake_n_208, image_snake_n_209, image_snake_n_210, image_snake_n_211 : std_logic;
  signal image_snake_n_212, image_snake_n_213, image_snake_n_214, image_snake_n_215, image_snake_n_216 : std_logic;
  signal image_snake_n_217, image_snake_n_218, image_snake_n_219, image_snake_n_220, image_snake_n_224 : std_logic;
  signal image_snake_n_225, image_snake_n_226, image_snake_n_227, image_snake_n_228, image_snake_n_229 : std_logic;
  signal image_snake_n_230, image_snake_n_231, image_snake_n_232, image_snake_n_233, image_snake_n_234 : std_logic;
  signal image_snake_n_235, image_snake_n_236, image_snake_n_237, image_snake_n_238, image_snake_n_239 : std_logic;
  signal image_snake_n_240, image_snake_n_241, image_snake_n_242, image_snake_n_243, image_snake_n_244 : std_logic;
  signal image_snake_n_245, image_snake_n_246, image_snake_n_247, image_snake_n_248, image_snake_n_249 : std_logic;
  signal image_snake_n_250, image_snake_n_251, image_snake_n_252, image_snake_n_253, image_snake_n_254 : std_logic;
  signal image_snake_n_255, image_snake_n_256, image_snake_n_257, image_snake_n_258, image_snake_n_259 : std_logic;
  signal image_snake_n_260, image_snake_n_261, image_snake_n_262, image_snake_n_263, image_snake_n_264 : std_logic;
  signal image_snake_n_265, image_snake_n_266, image_snake_n_267, image_snake_n_268, image_snake_n_269 : std_logic;
  signal image_snake_n_270, image_snake_n_271, image_snake_n_272, image_snake_n_273, image_snake_n_274 : std_logic;
  signal image_snake_n_275, image_snake_n_276, image_snake_n_277, image_snake_n_278, image_snake_n_279 : std_logic;
  signal image_snake_n_280, image_snake_n_281, image_snake_n_282, image_snake_n_283, image_snake_n_284 : std_logic;
  signal image_snake_n_285, image_snake_n_286, image_snake_n_287, image_snake_n_288, image_snake_n_289 : std_logic;
  signal image_snake_n_290, image_snake_n_291, image_snake_n_292, image_snake_n_293, image_snake_n_294 : std_logic;
  signal image_snake_n_295, image_snake_n_296, image_snake_n_297, image_snake_n_298, image_snake_n_299 : std_logic;
  signal image_snake_n_300, image_snake_n_301, image_snake_n_302, image_snake_n_303, image_snake_n_304 : std_logic;
  signal image_snake_n_305, image_snake_n_306, image_snake_n_307, image_snake_n_308, image_snake_n_309 : std_logic;
  signal image_snake_n_310, image_snake_n_311, image_snake_n_312, image_snake_n_313, image_snake_n_314 : std_logic;
  signal image_snake_n_315, image_snake_n_316, image_snake_n_317, image_snake_n_318, image_snake_n_319 : std_logic;
  signal image_snake_n_320, image_snake_n_321, image_snake_n_322, image_snake_n_323, image_snake_n_324 : std_logic;
  signal image_snake_n_325, image_snake_n_326, image_snake_n_327, image_snake_n_328, image_snake_n_329 : std_logic;
  signal image_snake_n_330, image_snake_n_331, image_snake_n_332, image_snake_n_333, image_snake_n_334 : std_logic;
  signal image_snake_n_335, image_snake_n_336, image_snake_n_337, image_snake_n_338, vga_ctrl_h_cnt_n_0 : std_logic;
  signal vga_ctrl_h_cnt_n_1, vga_ctrl_h_cnt_n_2, vga_ctrl_h_cnt_n_3, vga_ctrl_h_cnt_n_4, vga_ctrl_h_cnt_n_5 : std_logic;
  signal vga_ctrl_h_cnt_n_6, vga_ctrl_h_cnt_n_7, vga_ctrl_h_cnt_n_8, vga_ctrl_h_cnt_n_9, vga_ctrl_h_cnt_n_10 : std_logic;
  signal vga_ctrl_h_cnt_n_11, vga_ctrl_h_cnt_n_12, vga_ctrl_h_cnt_n_13, vga_ctrl_h_cnt_n_14, vga_ctrl_h_cnt_n_15 : std_logic;
  signal vga_ctrl_h_cnt_n_16, vga_ctrl_h_count_reset, vga_ctrl_h_ctrl_n_0, vga_ctrl_h_ctrl_n_1, vga_ctrl_h_ctrl_n_2 : std_logic;
  signal vga_ctrl_h_ctrl_n_3, vga_ctrl_h_ctrl_n_4, vga_ctrl_h_ctrl_n_5, vga_ctrl_h_ctrl_n_6, vga_ctrl_h_ctrl_n_7 : std_logic;
  signal vga_ctrl_h_ctrl_n_8, vga_ctrl_h_ctrl_n_9, vga_ctrl_h_ctrl_n_10, vga_ctrl_h_ctrl_n_11, vga_ctrl_h_ctrl_n_12 : std_logic;
  signal vga_ctrl_h_ctrl_n_13, vga_ctrl_h_ctrl_n_14, vga_ctrl_h_ctrl_n_15, vga_ctrl_h_ctrl_n_16, vga_ctrl_h_ctrl_n_17 : std_logic;
  signal vga_ctrl_h_ctrl_n_18, vga_ctrl_h_ctrl_n_19, vga_ctrl_h_video_on, vga_ctrl_v_cnt_n_0, vga_ctrl_v_cnt_n_1 : std_logic;
  signal vga_ctrl_v_cnt_n_2, vga_ctrl_v_cnt_n_3, vga_ctrl_v_cnt_n_4, vga_ctrl_v_cnt_n_5, vga_ctrl_v_cnt_n_6 : std_logic;
  signal vga_ctrl_v_cnt_n_7, vga_ctrl_v_cnt_n_8, vga_ctrl_v_cnt_n_9, vga_ctrl_v_cnt_n_10, vga_ctrl_v_cnt_n_11 : std_logic;
  signal vga_ctrl_v_cnt_n_12, vga_ctrl_v_cnt_n_13, vga_ctrl_v_cnt_n_14, vga_ctrl_v_cnt_n_15, vga_ctrl_v_cnt_n_16 : std_logic;
  signal vga_ctrl_v_cnt_n_17, vga_ctrl_v_cnt_n_18, vga_ctrl_v_cnt_n_19, vga_ctrl_v_ctrl_n_0, vga_ctrl_v_ctrl_n_1 : std_logic;
  signal vga_ctrl_v_ctrl_n_2, vga_ctrl_v_ctrl_n_3, vga_ctrl_v_ctrl_n_4, vga_ctrl_v_ctrl_n_5, vga_ctrl_v_ctrl_n_6 : std_logic;
  signal vga_ctrl_v_ctrl_n_7, vga_ctrl_v_ctrl_n_8, vga_ctrl_v_ctrl_n_9, vga_ctrl_v_ctrl_n_10, vga_ctrl_v_ctrl_n_11 : std_logic;
  signal vga_ctrl_v_ctrl_n_12, vga_ctrl_v_ctrl_n_13, vga_ctrl_v_ctrl_n_14, vga_ctrl_v_ctrl_n_15, vga_ctrl_v_ctrl_n_16 : std_logic;
  signal vga_ctrl_v_ctrl_n_17, vga_ctrl_v_ctrl_n_18, vga_ctrl_v_ctrl_n_19, vga_ctrl_v_ctrl_n_20, vga_ctrl_v_ctrl_n_21 : std_logic;
  signal vga_ctrl_v_ctrl_n_22, vga_ctrl_v_ctrl_n_23, vga_ctrl_v_ctrl_n_24, vga_ctrl_v_ctrl_n_25, vga_ctrl_v_ctrl_n_29 : std_logic;
  signal vga_ctrl_v_video_on, video_on : std_logic;

begin

  image_rgb_g354 : ND2D4BWP7T port map(A1 => image_rgb_n_71, A2 => image_rgb_n_72, ZN => red);
  image_rgb_g355 : IND2D1BWP7T port map(A1 => image_rgb_state(2), B1 => image_rgb_n_67, ZN => image_rgb_n_72);
  image_rgb_g356 : IND2D1BWP7T port map(A1 => image_rgb_n_90, B1 => image_rgb_state(2), ZN => image_rgb_n_71);
  image_rgb_g357 : OR2D4BWP7T port map(A1 => image_rgb_n_70, A2 => image_rgb_n_67, Z => blue);
  image_rgb_g358 : OAI31D0BWP7T port map(A1 => image_rgb_state(1), A2 => image_rgb_state(2), A3 => image_rgb_n_65, B => image_rgb_n_66, ZN => image_rgb_n_70);
  image_rgb_g362 : AO21D0BWP7T port map(A1 => image_rgb_n_64, A2 => image_rgb_state(0), B => image_rgb_n_67, Z => image_rgb_n_90);
  image_rgb_g363 : ND2D0BWP7T port map(A1 => image_rgb_state(2), A2 => image_rgb_state(1), ZN => image_rgb_n_66);
  image_rgb_g364 : NR2D1BWP7T port map(A1 => image_rgb_n_64, A2 => image_rgb_state(0), ZN => image_rgb_n_67);
  image_rgb_g365 : CKND2D1BWP7T port map(A1 => image_rgb_n_64, A2 => image_rgb_n_65, ZN => image_rgb_n_91);
  image_rgb_g366 : ND2D1BWP7T port map(A1 => image_rgb_state(0), A2 => image_rgb_state(1), ZN => image_rgb_n_89);
  image_rgb_g367 : INR2D1BWP7T port map(A1 => image_rgb_state(2), B1 => image_rgb_n_65, ZN => image_rgb_n_93);
  image_rgb_g664 : AO221D0BWP7T port map(A1 => image_rgb_n_59, A2 => image_item_inter, B1 => image_rgb_n_53, B2 => image_rgb_n_57, C => image_rgb_n_58, Z => image_rgb_n_63);
  image_rgb_g665 : AO211D0BWP7T port map(A1 => image_rgb_n_60, A2 => image_item_inter, B => image_rgb_n_61, C => image_rgb_n_58, Z => image_rgb_n_62);
  image_rgb_g666 : INR3D0BWP7T port map(A1 => image_rgb_n_53, B1 => image_rgb_n_56, B2 => image_rgb_n_57, ZN => image_rgb_n_61);
  image_rgb_g667 : AO32D1BWP7T port map(A1 => image_rgb_n_47, A2 => image_rgb_state(1), A3 => image_rgb_state(2), B1 => image_item_type_inter(1), B2 => image_rgb_n_55, Z => image_rgb_n_60);
  image_rgb_g668 : AO22D0BWP7T port map(A1 => image_item_type_inter(0), A2 => image_rgb_n_55, B1 => image_rgb_n_93, B2 => image_rgb_n_47, Z => image_rgb_n_59);
  image_rgb_g669 : INR2D1BWP7T port map(A1 => image_snake_inter, B1 => image_rgb_n_54, ZN => image_rgb_n_58);
  image_rgb_g671 : OA21D0BWP7T port map(A1 => image_rgb_n_49, A2 => image_color_cnt_inter(5), B => image_color_cnt_inter(6), Z => image_rgb_n_56);
  image_rgb_g672 : AOI21D0BWP7T port map(A1 => image_rgb_n_51, A2 => image_color_cnt_inter(5), B => image_color_cnt_inter(6), ZN => image_rgb_n_57);
  image_rgb_g673 : OAI31D0BWP7T port map(A1 => image_rgb_state(2), A2 => image_rgb_n_91, A3 => image_rgb_n_10, B => image_rgb_n_50, ZN => image_rgb_n_55);
  image_rgb_g674 : AOI211XD0BWP7T port map(A1 => image_rgb_n_46, A2 => image_rgb_n_89, B => image_rgb_n_48, C => image_rgb_n_29, ZN => image_rgb_n_54);
  image_rgb_g675 : IAO21D0BWP7T port map(A1 => image_rgb_n_46, A2 => image_rgb_n_44, B => image_snake_inter, ZN => image_rgb_n_52);
  image_rgb_g676 : OA21D0BWP7T port map(A1 => image_rgb_n_25, A2 => image_snake_inter, B => image_rgb_n_46, Z => image_rgb_n_53);
  image_rgb_g677 : AO21D0BWP7T port map(A1 => image_rgb_n_22, A2 => image_color_cnt_inter(3), B => image_color_cnt_inter(4), Z => image_rgb_n_51);
  image_rgb_g678 : IAO21D0BWP7T port map(A1 => image_rgb_n_45, A2 => image_snake_inter, B => image_rgb_n_48, ZN => image_rgb_n_50);
  image_rgb_g679 : OA21D0BWP7T port map(A1 => image_rgb_n_43, A2 => image_color_cnt_inter(3), B => image_color_cnt_inter(4), Z => image_rgb_n_49);
  image_rgb_g680 : INR2D1BWP7T port map(A1 => image_rgb_n_47, B1 => image_rgb_n_89, ZN => image_rgb_n_48);
  image_rgb_g681 : INVD0BWP7T port map(I => image_rgb_n_45, ZN => image_rgb_n_46);
  image_rgb_g682 : AOI21D0BWP7T port map(A1 => image_rgb_n_90, A2 => image_rgb_n_8, B => image_rgb_n_10, ZN => image_rgb_n_44);
  image_rgb_g683 : NR2D1BWP7T port map(A1 => image_rgb_n_10, A2 => image_flick_enable, ZN => image_rgb_n_47);
  image_rgb_g684 : IND2D1BWP7T port map(A1 => image_rgb_n_10, B1 => image_flick_enable, ZN => image_rgb_n_45);
  image_rgb_g685 : OA21D0BWP7T port map(A1 => image_color_cnt_inter(1), A2 => image_color_cnt_inter(0), B => image_color_cnt_inter(2), Z => image_rgb_n_43);
  image_rgb_g686 : AOI21D0BWP7T port map(A1 => image_rgb_n_91, A2 => image_rgb_n_8, B => image_rgb_n_10, ZN => image_rgb_n_29);
  image_rgb_g687 : INR3D0BWP7T port map(A1 => image_rgb_n_89, B1 => image_rgb_state(2), B2 => image_item_inter, ZN => image_rgb_n_25);
  image_rgb_g688 : AO21D0BWP7T port map(A1 => image_color_cnt_inter(0), A2 => image_color_cnt_inter(1), B => image_color_cnt_inter(2), Z => image_rgb_n_22);
  image_rgb_g689 : IND2D1BWP7T port map(A1 => reset, B1 => video_on, ZN => image_rgb_n_10);
  image_rgb_g2 : CKXOR2D4BWP7T port map(A1 => image_rgb_state(1), A2 => image_rgb_n_93, Z => green);
  image_rgb_state_reg_0 : DFD1BWP7T port map(CP => clk, D => image_rgb_n_63, Q => image_rgb_state(0), QN => image_rgb_n_65);
  image_rgb_state_reg_1 : DFD1BWP7T port map(CP => clk, D => image_rgb_n_62, Q => image_rgb_state(1), QN => image_rgb_n_64);
  image_rgb_state_reg_2 : DFKCND1BWP7T port map(CP => clk, CN => image_rgb_n_52, D => image_item_inter, Q => image_rgb_state(2), QN => image_rgb_n_8);
  image_item_g4693 : INR3D0BWP7T port map(A1 => power_in(1), B1 => image_item_n_393, B2 => image_item_n_391, ZN => image_item_type_inter(1));
  image_item_g4694 : INR3D0BWP7T port map(A1 => power_in(0), B1 => image_item_n_393, B2 => image_item_n_391, ZN => image_item_type_inter(0));
  image_item_g4695 : IND2D1BWP7T port map(A1 => image_item_n_391, B1 => image_item_n_393, ZN => image_item_inter);
  image_item_g4696 : OAI221D0BWP7T port map(A1 => image_item_n_377, A2 => image_item_n_235, B1 => image_item_n_345, B2 => image_item_n_340, C => image_item_n_392, ZN => image_item_n_393);
  image_item_g4697 : NR4D0BWP7T port map(A1 => image_item_n_388, A2 => image_item_n_390, A3 => image_item_n_320, A4 => image_item_n_349, ZN => image_item_n_392);
  image_item_g4698 : AOI211XD0BWP7T port map(A1 => image_item_n_319, A2 => image_item_n_375, B => image_item_n_389, C => image_item_n_383, ZN => image_item_n_391);
  image_item_g4699 : OAI32D1BWP7T port map(A1 => image_item_n_238, A2 => image_item_n_343, A3 => image_item_n_385, B1 => image_item_n_236, B2 => image_item_n_294, ZN => image_item_n_390);
  image_item_g4700 : IND4D0BWP7T port map(A1 => image_item_n_387, B1 => image_item_n_379, B2 => image_item_n_382, B3 => image_item_n_352, ZN => image_item_n_389);
  image_item_g4701 : OAI211D1BWP7T port map(A1 => image_item_n_356, A2 => image_item_n_378, B => image_item_n_386, C => image_item_n_350, ZN => image_item_n_388);
  image_item_g4702 : OAI211D1BWP7T port map(A1 => image_item_n_360, A2 => image_item_n_365, B => image_item_n_368, C => image_item_n_384, ZN => image_item_n_387);
  image_item_g4703 : NR4D0BWP7T port map(A1 => image_item_n_304, A2 => image_item_n_381, A3 => image_item_n_380, A4 => image_item_n_369, ZN => image_item_n_386);
  image_item_g4704 : ND4D0BWP7T port map(A1 => image_item_n_303, A2 => image_item_n_376, A3 => image_item_n_331, A4 => image_item_n_358, ZN => image_item_n_385);
  image_item_g4705 : AOI211XD0BWP7T port map(A1 => image_item_n_305, A2 => image_item_n_355, B => image_item_n_353, C => image_item_n_371, ZN => image_item_n_384);
  image_item_g4706 : AOI21D0BWP7T port map(A1 => image_item_n_375, A2 => image_item_n_372, B => image_item_n_354, ZN => image_item_n_383);
  image_item_g4707 : IND4D0BWP7T port map(A1 => image_item_n_363, B1 => image_item_n_240, B2 => image_item_n_372, B3 => image_item_n_366, ZN => image_item_n_382);
  image_item_g4708 : OAI32D1BWP7T port map(A1 => image_item_n_237, A2 => image_item_n_175, A3 => image_item_n_254, B1 => image_item_n_374, B2 => image_item_n_344, ZN => image_item_n_381);
  image_item_g4709 : AOI22D0BWP7T port map(A1 => image_item_n_373, A2 => image_item_n_346, B1 => image_item_n_348, B2 => image_item_n_330, ZN => image_item_n_380);
  image_item_g4710 : MAOI22D0BWP7T port map(A1 => image_item_n_328, A2 => image_item_n_354, B1 => image_item_n_370, B2 => image_item_n_366, ZN => image_item_n_379);
  image_item_g4711 : INR2XD0BWP7T port map(A1 => image_item_n_376, B1 => image_item_n_374, ZN => image_item_n_378);
  image_item_g4712 : ND4D0BWP7T port map(A1 => image_item_n_351, A2 => image_item_n_346, A3 => image_item_n_333, A4 => image_item_n_335, ZN => image_item_n_377);
  image_item_g4713 : NR2XD0BWP7T port map(A1 => image_item_n_361, A2 => image_item_n_345, ZN => image_item_n_373);
  image_item_g4714 : ND2D1BWP7T port map(A1 => image_item_n_367, A2 => h_count(7), ZN => image_item_n_376);
  image_item_g4715 : IND2D1BWP7T port map(A1 => h_count(7), B1 => image_item_n_364, ZN => image_item_n_375);
  image_item_g4716 : NR2XD0BWP7T port map(A1 => image_item_n_367, A2 => h_count(7), ZN => image_item_n_374);
  image_item_g4717 : AOI21D0BWP7T port map(A1 => image_item_n_355, A2 => image_item_n_1, B => image_item_n_337, ZN => image_item_n_371);
  image_item_g4718 : AOI21D0BWP7T port map(A1 => image_item_n_359, A2 => image_item_n_328, B => image_item_n_287, ZN => image_item_n_370);
  image_item_g4719 : AOI21D0BWP7T port map(A1 => image_item_n_357, A2 => image_item_n_358, B => image_item_n_334, ZN => image_item_n_369);
  image_item_g4720 : OAI31D0BWP7T port map(A1 => image_item_n_263, A2 => image_item_n_341, A3 => image_item_n_233, B => image_item_n_362, ZN => image_item_n_368);
  image_item_g4721 : IND2D1BWP7T port map(A1 => image_item_n_364, B1 => h_count(7), ZN => image_item_n_372);
  image_item_g4722 : OAI211D1BWP7T port map(A1 => image_item_n_289, A2 => image_item_n_81, B => image_item_n_339, C => image_item_n_336, ZN => image_item_n_365);
  image_item_g4723 : OAI21D0BWP7T port map(A1 => image_item_n_316, A2 => power_in(11), B => image_item_n_0, ZN => image_item_n_367);
  image_item_g4724 : AOI21D0BWP7T port map(A1 => h_count(5), A2 => image_item_n_314, B => image_item_n_359, ZN => image_item_n_366);
  image_item_g4725 : OAI221D0BWP7T port map(A1 => image_item_n_58, A2 => image_item_n_268, B1 => image_item_n_239, B2 => image_item_n_229, C => image_item_n_317, ZN => image_item_n_363);
  image_item_g4726 : OA32D1BWP7T port map(A1 => image_item_n_269, A2 => image_item_n_272, A3 => image_item_n_322, B1 => image_item_n_341, B2 => image_item_n_279, Z => image_item_n_362);
  image_item_g4727 : IAO21D0BWP7T port map(A1 => image_item_n_347, A2 => image_item_n_348, B => image_item_n_330, ZN => image_item_n_361);
  image_item_g4728 : MOAI22D0BWP7T port map(A1 => image_item_n_318, A2 => item_in(11), B1 => image_item_n_318, B2 => item_in(11), ZN => image_item_n_364);
  image_item_g4729 : INVD0BWP7T port map(I => image_item_n_1, ZN => image_item_n_360);
  image_item_g4730 : CKND1BWP7T port map(I => image_item_n_356, ZN => image_item_n_357);
  image_item_g4732 : AN2D0BWP7T port map(A1 => h_count(6), A2 => image_item_n_326, Z => image_item_n_359);
  image_item_g4733 : ND2D1BWP7T port map(A1 => h_count(6), A2 => image_item_n_323, ZN => image_item_n_358);
  image_item_g4734 : NR2D1BWP7T port map(A1 => h_count(6), A2 => image_item_n_323, ZN => image_item_n_356);
  image_item_g4735 : IND2D1BWP7T port map(A1 => v_count(8), B1 => image_item_n_342, ZN => image_item_n_355);
  image_item_g4736 : AOI22D0BWP7T port map(A1 => image_item_n_338, A2 => image_item_n_336, B1 => image_item_n_81, B2 => image_item_n_289, ZN => image_item_n_353);
  image_item_g4737 : AOI22D0BWP7T port map(A1 => image_item_n_321, A2 => image_item_n_315, B1 => image_item_n_287, B2 => image_item_n_327, ZN => image_item_n_352);
  image_item_g4738 : AOI221D0BWP7T port map(A1 => v_count(5), A2 => image_item_n_277, B1 => image_item_n_230, B2 => image_item_n_261, C => image_item_n_347, ZN => image_item_n_351);
  image_item_g4739 : MOAI22D0BWP7T port map(A1 => image_item_n_332, A2 => image_item_n_334, B1 => image_item_n_58, B2 => image_item_n_275, ZN => image_item_n_350);
  image_item_g4740 : AOI22D0BWP7T port map(A1 => image_item_n_329, A2 => image_item_n_335, B1 => image_item_n_60, B2 => image_item_n_278, ZN => image_item_n_349);
  image_item_g4741 : NR2D0BWP7T port map(A1 => h_count(6), A2 => image_item_n_326, ZN => image_item_n_354);
  image_item_g4742 : HA1D0BWP7T port map(A => image_item_n_0, B => h_count(8), CO => image_item_n_343, S => image_item_n_344);
  image_item_g4743 : NR2D0BWP7T port map(A1 => v_count(7), A2 => image_item_n_324, ZN => image_item_n_348);
  image_item_g4744 : AN2D0BWP7T port map(A1 => v_count(7), A2 => image_item_n_324, Z => image_item_n_347);
  image_item_g4745 : ND2D1BWP7T port map(A1 => v_count(8), A2 => image_item_n_325, ZN => image_item_n_346);
  image_item_g4746 : NR2D0BWP7T port map(A1 => v_count(8), A2 => image_item_n_325, ZN => image_item_n_345);
  image_item_g4748 : OA21D0BWP7T port map(A1 => v_count(9), A2 => image_item_n_311, B => image_item_n_333, Z => image_item_n_340);
  image_item_g4749 : AOI211D1BWP7T port map(A1 => image_item_n_251, A2 => image_item_n_210, B => image_item_n_272, C => image_item_n_293, ZN => image_item_n_339);
  image_item_g4750 : MOAI22D0BWP7T port map(A1 => image_item_n_298, A2 => item_in(6), B1 => image_item_n_298, B2 => item_in(6), ZN => image_item_n_342);
  image_item_g4751 : OR2D1BWP7T port map(A1 => image_item_n_280, A2 => image_item_n_322, Z => image_item_n_341);
  image_item_g4752 : CKND1BWP7T port map(I => image_item_n_337, ZN => image_item_n_338);
  image_item_g4753 : INVD0BWP7T port map(I => image_item_n_331, ZN => image_item_n_332);
  image_item_g4754 : INVD0BWP7T port map(I => image_item_n_330, ZN => image_item_n_329);
  image_item_g4755 : INVD0BWP7T port map(I => image_item_n_327, ZN => image_item_n_328);
  image_item_g4756 : NR2XD0BWP7T port map(A1 => v_count(7), A2 => image_item_n_310, ZN => image_item_n_337);
  image_item_g4757 : ND2D1BWP7T port map(A1 => v_count(7), A2 => image_item_n_310, ZN => image_item_n_336);
  image_item_g4758 : ND2D1BWP7T port map(A1 => v_count(6), A2 => image_item_n_312, ZN => image_item_n_335);
  image_item_g4759 : NR2XD0BWP7T port map(A1 => h_count(5), A2 => image_item_n_313, ZN => image_item_n_334);
  image_item_g4760 : ND2D1BWP7T port map(A1 => v_count(9), A2 => image_item_n_311, ZN => image_item_n_333);
  image_item_g4761 : ND2D1BWP7T port map(A1 => h_count(5), A2 => image_item_n_313, ZN => image_item_n_331);
  image_item_g4762 : NR2XD0BWP7T port map(A1 => v_count(6), A2 => image_item_n_312, ZN => image_item_n_330);
  image_item_g4763 : NR2XD0BWP7T port map(A1 => h_count(5), A2 => image_item_n_314, ZN => image_item_n_327);
  image_item_g4764 : OAI221D0BWP7T port map(A1 => image_item_n_295, A2 => image_item_n_240, B1 => image_item_n_208, B2 => image_item_n_260, C => image_item_n_271, ZN => image_item_n_321);
  image_item_g4765 : AOI222D0BWP7T port map(A1 => image_item_n_250, A2 => image_item_n_264, B1 => image_item_n_256, B2 => image_item_n_188, C1 => image_item_n_294, C2 => image_item_n_236, ZN => image_item_n_320);
  image_item_g4766 : OAI21D0BWP7T port map(A1 => h_count(8), A2 => image_item_n_307, B => image_item_n_317, ZN => image_item_n_319);
  image_item_g4767 : MAOI22D0BWP7T port map(A1 => image_item_n_306, A2 => item_in(10), B1 => image_item_n_306, B2 => item_in(10), ZN => image_item_n_326);
  image_item_g4768 : OAI21D0BWP7T port map(A1 => image_item_n_301, A2 => power_in(6), B => image_item_n_311, ZN => image_item_n_325);
  image_item_g4769 : OAI211D1BWP7T port map(A1 => image_item_n_88, A2 => image_item_n_218, B => image_item_n_308, C => image_item_n_300, ZN => image_item_n_324);
  image_item_g4770 : MAOI22D0BWP7T port map(A1 => image_item_n_309, A2 => power_in(10), B1 => image_item_n_309, B2 => power_in(10), ZN => image_item_n_323);
  image_item_g4771 : AOI211D1BWP7T port map(A1 => v_count(6), A2 => image_item_n_289, B => image_item_n_269, C => image_item_n_297, ZN => image_item_n_322);
  image_item_g4772 : INR2XD0BWP7T port map(A1 => power_in(10), B1 => image_item_n_309, ZN => image_item_n_316);
  image_item_g4773 : ND2D1BWP7T port map(A1 => image_item_n_295, A2 => image_item_n_240, ZN => image_item_n_315);
  image_item_g4774 : IND2D1BWP7T port map(A1 => image_item_n_306, B1 => item_in(10), ZN => image_item_n_318);
  image_item_g4775 : ND2D0BWP7T port map(A1 => h_count(8), A2 => image_item_n_307, ZN => image_item_n_317);
  image_item_g4776 : MAOI22D0BWP7T port map(A1 => image_item_n_296, A2 => item_in(11), B1 => image_item_n_296, B2 => item_in(11), ZN => image_item_n_314);
  image_item_g4777 : MOAI22D0BWP7T port map(A1 => image_item_n_299, A2 => power_in(11), B1 => image_item_n_299, B2 => power_in(11), ZN => image_item_n_313);
  image_item_g4778 : MOAI22D0BWP7T port map(A1 => image_item_n_291, A2 => power_in(4), B1 => image_item_n_291, B2 => power_in(4), ZN => image_item_n_312);
  image_item_g4779 : OAI211D1BWP7T port map(A1 => power_in(4), A2 => image_item_n_281, B => power_in(5), C => power_in(6), ZN => image_item_n_311);
  image_item_g4780 : IND3D1BWP7T port map(A1 => image_item_n_281, B1 => image_item_n_88, B2 => image_item_n_218, ZN => image_item_n_308);
  image_item_g4781 : OAI21D0BWP7T port map(A1 => image_item_n_288, A2 => item_in(5), B => image_item_n_298, ZN => image_item_n_310);
  image_item_g4782 : CKAN2D1BWP7T port map(A1 => image_item_n_302, A2 => image_item_n_286, Z => image_item_n_309);
  image_item_g4784 : OAI21D0BWP7T port map(A1 => v_count(9), A2 => image_item_n_282, B => image_item_n_292, ZN => image_item_n_305);
  image_item_g4785 : AOI21D0BWP7T port map(A1 => h_count(4), A2 => image_item_n_275, B => image_item_n_290, ZN => image_item_n_304);
  image_item_g4786 : AOI222D0BWP7T port map(A1 => h_count(4), A2 => image_item_n_274, B1 => image_item_n_258, B2 => image_item_n_206, C1 => image_item_n_257, C2 => h_count(2), ZN => image_item_n_303);
  image_item_g4787 : ND3D0BWP7T port map(A1 => image_item_n_284, A2 => item_in(11), A3 => item_in(10), ZN => image_item_n_307);
  image_item_g4788 : OAI21D0BWP7T port map(A1 => image_item_n_285, A2 => item_in(11), B => image_item_n_284, ZN => image_item_n_306);
  image_item_g4790 : INVD0BWP7T port map(I => image_item_n_300, ZN => image_item_n_301);
  image_item_g4791 : NR2XD0BWP7T port map(A1 => v_count(6), A2 => image_item_n_289, ZN => image_item_n_297);
  image_item_g4792 : IND2D1BWP7T port map(A1 => image_item_n_283, B1 => power_in(11), ZN => image_item_n_302);
  image_item_g4793 : ND2D1BWP7T port map(A1 => image_item_n_281, A2 => power_in(5), ZN => image_item_n_300);
  image_item_g4794 : INR2D1BWP7T port map(A1 => image_item_n_286, B1 => image_item_n_283, ZN => image_item_n_299);
  image_item_g4795 : ND2D1BWP7T port map(A1 => image_item_n_288, A2 => item_in(5), ZN => image_item_n_298);
  image_item_g4796 : INVD0BWP7T port map(I => image_item_n_292, ZN => image_item_n_293);
  image_item_g4797 : OAI22D0BWP7T port map(A1 => image_item_n_267, A2 => image_item_n_238, B1 => h_count(4), B2 => image_item_n_275, ZN => image_item_n_290);
  image_item_g4798 : IND2D1BWP7T port map(A1 => image_item_n_285, B1 => image_item_n_284, ZN => image_item_n_296);
  image_item_g4799 : MOAI22D0BWP7T port map(A1 => h_count(4), A2 => image_item_n_268, B1 => h_count(4), B2 => image_item_n_268, ZN => image_item_n_295);
  image_item_g4800 : OAI22D0BWP7T port map(A1 => v_count(5), A2 => image_item_n_278, B1 => image_item_n_60, B2 => image_item_n_277, ZN => image_item_n_294);
  image_item_g4801 : ND2D1BWP7T port map(A1 => v_count(9), A2 => image_item_n_282, ZN => image_item_n_292);
  image_item_g4802 : MAOI22D0BWP7T port map(A1 => image_item_n_276, A2 => power_in(6), B1 => image_item_n_276, B2 => power_in(6), ZN => image_item_n_291);
  image_item_g4803 : FA1D0BWP7T port map(A => item_in(4), B => item_in(6), CI => image_item_n_265, CO => image_item_n_288, S => image_item_n_289);
  image_item_g4804 : ND2D1BWP7T port map(A1 => image_item_n_58, A2 => image_item_n_268, ZN => image_item_n_287);
  image_item_g4805 : ND2D1BWP7T port map(A1 => image_item_n_273, A2 => power_in(9), ZN => image_item_n_286);
  image_item_g4806 : INR2XD0BWP7T port map(A1 => item_in(9), B1 => image_item_n_253, ZN => image_item_n_285);
  image_item_g4807 : IND2D1BWP7T port map(A1 => item_in(9), B1 => image_item_n_253, ZN => image_item_n_284);
  image_item_g4808 : IAO21D0BWP7T port map(A1 => image_item_n_270, A2 => image_item_n_269, B => image_item_n_242, ZN => image_item_n_280);
  image_item_g4809 : OA32D1BWP7T port map(A1 => v_count(2), A2 => image_item_n_227, A3 => image_item_n_263, B1 => image_item_n_210, B2 => image_item_n_255, Z => image_item_n_279);
  image_item_g4810 : NR2XD0BWP7T port map(A1 => image_item_n_273, A2 => power_in(9), ZN => image_item_n_283);
  image_item_g4811 : OAI211D1BWP7T port map(A1 => item_in(4), A2 => image_item_n_265, B => item_in(6), C => item_in(5), ZN => image_item_n_282);
  image_item_g4812 : OA21D0BWP7T port map(A1 => power_in(4), A2 => power_in(6), B => image_item_n_276, Z => image_item_n_281);
  image_item_g4813 : INVD0BWP7T port map(I => image_item_n_278, ZN => image_item_n_277);
  image_item_g4814 : INVD0BWP7T port map(I => image_item_n_275, ZN => image_item_n_274);
  image_item_g4815 : FA1D0BWP7T port map(A => power_in(3), B => power_in(5), CI => image_item_n_161, CO => image_item_n_276, S => image_item_n_278);
  image_item_g4816 : FA1D0BWP7T port map(A => power_in(8), B => power_in(10), CI => image_item_n_204, CO => image_item_n_273, S => image_item_n_275);
  image_item_g4817 : IND2D1BWP7T port map(A1 => image_item_n_270, B1 => image_item_n_242, ZN => image_item_n_272);
  image_item_g4818 : OAI211D1BWP7T port map(A1 => h_count(0), A2 => image_item_n_213, B => image_item_n_234, C => image_item_n_262, ZN => image_item_n_271);
  image_item_g4819 : NR2D1BWP7T port map(A1 => image_item_n_60, A2 => image_item_n_266, ZN => image_item_n_270);
  image_item_g4820 : INR2D1BWP7T port map(A1 => image_item_n_266, B1 => v_count(5), ZN => image_item_n_269);
  image_item_g4821 : AOI22D0BWP7T port map(A1 => image_item_n_254, A2 => image_item_n_259, B1 => image_item_n_175, B2 => image_item_n_241, ZN => image_item_n_267);
  image_item_g4822 : MOAI22D0BWP7T port map(A1 => image_item_n_252, A2 => item_in(8), B1 => image_item_n_252, B2 => item_in(8), ZN => image_item_n_268);
  image_item_g4823 : FA1D0BWP7T port map(A => item_in(3), B => item_in(5), CI => image_item_n_212, CO => image_item_n_265, S => image_item_n_266);
  image_item_g4824 : CKND2D0BWP7T port map(A1 => image_item_n_261, A2 => image_item_n_236, ZN => image_item_n_264);
  image_item_g4825 : ND2D1BWP7T port map(A1 => image_item_n_260, A2 => image_item_n_208, ZN => image_item_n_262);
  image_item_g4826 : AN2D0BWP7T port map(A1 => image_item_n_255, A2 => image_item_n_210, Z => image_item_n_263);
  image_item_g4827 : CKND1BWP7T port map(I => image_item_n_258, ZN => image_item_n_259);
  image_item_g4828 : NR2D0BWP7T port map(A1 => image_item_n_241, A2 => power_in(8), ZN => image_item_n_257);
  image_item_g4829 : IND2D1BWP7T port map(A1 => image_item_n_244, B1 => image_item_n_236, ZN => image_item_n_256);
  image_item_g4830 : NR2D0BWP7T port map(A1 => image_item_n_188, A2 => image_item_n_244, ZN => image_item_n_261);
  image_item_g4831 : IND2D1BWP7T port map(A1 => image_item_n_239, B1 => image_item_n_240, ZN => image_item_n_260);
  image_item_g4832 : NR2D0BWP7T port map(A1 => image_item_n_175, A2 => image_item_n_241, ZN => image_item_n_258);
  image_item_g4833 : AOI31D0BWP7T port map(A1 => image_item_n_214, A2 => image_item_n_107, A3 => item_in(2), B => image_item_n_243, ZN => image_item_n_251);
  image_item_g4834 : OAI21D0BWP7T port map(A1 => image_item_n_228, A2 => v_count(2), B => image_item_n_232, ZN => image_item_n_250);
  image_item_g4835 : INR2D1BWP7T port map(A1 => image_item_n_242, B1 => image_item_n_243, ZN => image_item_n_255);
  image_item_g4836 : OAI22D0BWP7T port map(A1 => image_item_n_219, A2 => image_item_n_224, B1 => image_item_n_206, B2 => h_count(0), ZN => image_item_n_254);
  image_item_g4837 : MAOI222D1BWP7T port map(A => image_item_n_231, B => item_in(10), C => item_in(8), ZN => image_item_n_253);
  image_item_g4838 : MAOI22D0BWP7T port map(A1 => image_item_n_162, A2 => item_in(10), B1 => image_item_n_162, B2 => item_in(10), ZN => image_item_n_252);
  image_item_g4839 : NR2XD0BWP7T port map(A1 => v_count(4), A2 => image_item_n_223, ZN => image_item_n_244);
  image_item_g4840 : NR2XD0BWP7T port map(A1 => v_count(4), A2 => image_item_n_220, ZN => image_item_n_243);
  image_item_g4841 : ND2D1BWP7T port map(A1 => v_count(4), A2 => image_item_n_220, ZN => image_item_n_242);
  image_item_g4842 : NR2XD0BWP7T port map(A1 => h_count(3), A2 => image_item_n_221, ZN => image_item_n_241);
  image_item_g4843 : ND2D1BWP7T port map(A1 => h_count(3), A2 => image_item_n_222, ZN => image_item_n_240);
  image_item_g4844 : INVD1BWP7T port map(I => image_item_n_237, ZN => image_item_n_238);
  image_item_g4845 : INVD0BWP7T port map(I => image_item_n_236, ZN => image_item_n_235);
  image_item_g4846 : OAI211D1BWP7T port map(A1 => item_in(7), A2 => image_item_n_205, B => image_item_n_209, C => image_item_n_216, ZN => image_item_n_234);
  image_item_g4847 : MOAI22D0BWP7T port map(A1 => image_item_n_225, A2 => item_in(2), B1 => image_item_n_226, B2 => image_item_n_227, ZN => image_item_n_233);
  image_item_g4848 : MOAI22D0BWP7T port map(A1 => image_item_n_225, A2 => power_in(2), B1 => image_item_n_226, B2 => image_item_n_228, ZN => image_item_n_232);
  image_item_g4849 : NR2XD0BWP7T port map(A1 => h_count(3), A2 => image_item_n_222, ZN => image_item_n_239);
  image_item_g4850 : ND2D1BWP7T port map(A1 => h_count(3), A2 => image_item_n_221, ZN => image_item_n_237);
  image_item_g4851 : ND2D1BWP7T port map(A1 => v_count(4), A2 => image_item_n_223, ZN => image_item_n_236);
  image_item_g4852 : INVD1BWP7T port map(I => image_item_n_162, ZN => image_item_n_231);
  image_item_g4853 : ND3D0BWP7T port map(A1 => image_item_n_215, A2 => image_item_n_107, A3 => power_in(2), ZN => image_item_n_230);
  image_item_g4854 : AOI21D0BWP7T port map(A1 => image_item_n_209, A2 => image_item_n_213, B => image_item_n_217, ZN => image_item_n_229);
  image_item_g4855 : NR2D0BWP7T port map(A1 => image_item_n_205, A2 => power_in(7), ZN => image_item_n_224);
  image_item_g4856 : IND2D1BWP7T port map(A1 => image_item_n_188, B1 => image_item_n_215, ZN => image_item_n_228);
  image_item_g4857 : ND2D1BWP7T port map(A1 => image_item_n_210, A2 => image_item_n_214, ZN => image_item_n_227);
  image_item_g4858 : ND2D1BWP7T port map(A1 => image_item_n_207, A2 => image_item_n_107, ZN => image_item_n_226);
  image_item_g4859 : CKAN2D1BWP7T port map(A1 => image_item_n_207, A2 => v_count(2), Z => image_item_n_225);
  image_item_g4860 : MAOI22D0BWP7T port map(A1 => h_count(2), A2 => power_in(8), B1 => h_count(2), B2 => power_in(8), ZN => image_item_n_219);
  image_item_g4861 : OAI21D0BWP7T port map(A1 => power_in(2), A2 => power_in(4), B => image_item_n_114, ZN => image_item_n_223);
  image_item_g4862 : OAI21D0BWP7T port map(A1 => item_in(7), A2 => item_in(9), B => image_item_n_162, ZN => image_item_n_222);
  image_item_g4863 : OAI21D0BWP7T port map(A1 => power_in(7), A2 => power_in(9), B => image_item_n_201, ZN => image_item_n_221);
  image_item_g4864 : OAI21D0BWP7T port map(A1 => item_in(2), A2 => item_in(4), B => image_item_n_211, ZN => image_item_n_220);
  image_item_g4865 : INVD0BWP7T port map(I => image_item_n_216, ZN => image_item_n_217);
  image_item_g4866 : CKND1BWP7T port map(I => image_item_n_211, ZN => image_item_n_212);
  image_item_g4867 : INVD0BWP7T port map(I => image_item_n_209, ZN => image_item_n_208);
  image_item_g4868 : ND2D1BWP7T port map(A1 => power_in(4), A2 => power_in(6), ZN => image_item_n_218);
  image_item_g4869 : IND2D1BWP7T port map(A1 => item_in(8), B1 => h_count(2), ZN => image_item_n_216);
  image_item_g4870 : IND2D1BWP7T port map(A1 => power_in(3), B1 => v_count(3), ZN => image_item_n_215);
  image_item_g4871 : IND2D1BWP7T port map(A1 => item_in(3), B1 => v_count(3), ZN => image_item_n_214);
  image_item_g4872 : IND2D1BWP7T port map(A1 => h_count(1), B1 => item_in(7), ZN => image_item_n_213);
  image_item_g4873 : ND2D0BWP7T port map(A1 => item_in(4), A2 => item_in(2), ZN => image_item_n_211);
  image_item_g4874 : IND2D1BWP7T port map(A1 => v_count(3), B1 => item_in(3), ZN => image_item_n_210);
  image_item_g4875 : IND2D1BWP7T port map(A1 => h_count(2), B1 => item_in(8), ZN => image_item_n_209);
  image_item_g4876 : INVD0BWP7T port map(I => image_item_n_201, ZN => image_item_n_204);
  image_item_g4877 : CKND1BWP7T port map(I => image_item_n_114, ZN => image_item_n_161);
  image_item_g4878 : NR2XD0BWP7T port map(A1 => v_count(0), A2 => v_count(1), ZN => image_item_n_207);
  image_item_g4879 : IND2D1BWP7T port map(A1 => h_count(1), B1 => power_in(7), ZN => image_item_n_206);
  image_item_g4880 : CKND2D1BWP7T port map(A1 => h_count(1), A2 => h_count(0), ZN => image_item_n_205);
  image_item_g4881 : CKND2D1BWP7T port map(A1 => power_in(9), A2 => power_in(7), ZN => image_item_n_201);
  image_item_g4882 : INR2D1BWP7T port map(A1 => power_in(3), B1 => v_count(3), ZN => image_item_n_188);
  image_item_g4883 : INR2XD0BWP7T port map(A1 => power_in(8), B1 => h_count(2), ZN => image_item_n_175);
  image_item_g4884 : CKND2D1BWP7T port map(A1 => item_in(9), A2 => item_in(7), ZN => image_item_n_162);
  image_item_g4885 : ND2D0BWP7T port map(A1 => power_in(4), A2 => power_in(2), ZN => image_item_n_114);
  image_item_g4886 : INVD0BWP7T port map(I => v_count(2), ZN => image_item_n_107);
  image_item_g4887 : INVD0BWP7T port map(I => power_in(5), ZN => image_item_n_88);
  image_item_g4888 : INVD0BWP7T port map(I => v_count(6), ZN => image_item_n_81);
  image_item_g4889 : INVD0BWP7T port map(I => v_count(5), ZN => image_item_n_60);
  image_item_g4890 : INVD0BWP7T port map(I => h_count(4), ZN => image_item_n_58);
  image_item_g2 : IND2D1BWP7T port map(A1 => image_item_n_342, B1 => v_count(8), ZN => image_item_n_1);
  image_item_g4891 : IND2D1BWP7T port map(A1 => image_item_n_302, B1 => power_in(10), ZN => image_item_n_0);
  image_cnt_60hz_color_cnt_in_reg_9 : DFKCNQD1BWP7T port map(CP => clk, CN => image_cnt_60hz_n_1, D => image_cnt_60hz_n_53, Q => image_cnt_60hz_color_cnt_in(9));
  image_cnt_60hz_color_cnt_in_reg_8 : DFKCNQD1BWP7T port map(CP => clk, CN => image_cnt_60hz_n_1, D => image_cnt_60hz_n_52, Q => image_cnt_60hz_color_cnt_in(8));
  image_cnt_60hz_g610 : MOAI22D0BWP7T port map(A1 => image_cnt_60hz_n_51, A2 => image_cnt_60hz_color_cnt_in(9), B1 => image_cnt_60hz_n_51, B2 => image_cnt_60hz_color_cnt_in(9), ZN => image_cnt_60hz_n_53);
  image_cnt_60hz_color_cnt_in_reg_7 : DFKCNQD1BWP7T port map(CP => clk, CN => image_cnt_60hz_n_1, D => image_cnt_60hz_n_50, Q => image_cnt_60hz_color_cnt_in(7));
  image_cnt_60hz_g612 : MOAI22D0BWP7T port map(A1 => image_cnt_60hz_n_49, A2 => image_cnt_60hz_color_cnt_in(8), B1 => image_cnt_60hz_n_49, B2 => image_cnt_60hz_color_cnt_in(8), ZN => image_cnt_60hz_n_52);
  image_cnt_60hz_g613 : IND2D1BWP7T port map(A1 => image_cnt_60hz_n_49, B1 => image_cnt_60hz_color_cnt_in(8), ZN => image_cnt_60hz_n_51);
  image_cnt_60hz_color_cnt_in_reg_6 : DFKCNQD1BWP7T port map(CP => clk, CN => image_cnt_60hz_n_1, D => image_cnt_60hz_n_48, Q => image_color_cnt_inter(6));
  image_cnt_60hz_g615 : MOAI22D0BWP7T port map(A1 => image_cnt_60hz_n_47, A2 => image_cnt_60hz_color_cnt_in(7), B1 => image_cnt_60hz_n_47, B2 => image_cnt_60hz_color_cnt_in(7), ZN => image_cnt_60hz_n_50);
  image_cnt_60hz_g616 : IND2D1BWP7T port map(A1 => image_cnt_60hz_n_47, B1 => image_cnt_60hz_color_cnt_in(7), ZN => image_cnt_60hz_n_49);
  image_cnt_60hz_color_cnt_in_reg_5 : DFKCNQD1BWP7T port map(CP => clk, CN => image_cnt_60hz_n_1, D => image_cnt_60hz_n_46, Q => image_color_cnt_inter(5));
  image_cnt_60hz_g618 : MOAI22D0BWP7T port map(A1 => image_cnt_60hz_n_45, A2 => image_color_cnt_inter(6), B1 => image_cnt_60hz_n_45, B2 => image_color_cnt_inter(6), ZN => image_cnt_60hz_n_48);
  image_cnt_60hz_g619 : IND2D1BWP7T port map(A1 => image_cnt_60hz_n_45, B1 => image_color_cnt_inter(6), ZN => image_cnt_60hz_n_47);
  image_cnt_60hz_color_cnt_in_reg_4 : DFKCNQD1BWP7T port map(CP => clk, CN => image_cnt_60hz_n_1, D => image_cnt_60hz_n_44, Q => image_color_cnt_inter(4));
  image_cnt_60hz_g621 : MOAI22D0BWP7T port map(A1 => image_cnt_60hz_n_43, A2 => image_color_cnt_inter(5), B1 => image_cnt_60hz_n_43, B2 => image_color_cnt_inter(5), ZN => image_cnt_60hz_n_46);
  image_cnt_60hz_g622 : IND2D1BWP7T port map(A1 => image_cnt_60hz_n_43, B1 => image_color_cnt_inter(5), ZN => image_cnt_60hz_n_45);
  image_cnt_60hz_color_cnt_in_reg_3 : DFKCNQD1BWP7T port map(CP => clk, CN => image_cnt_60hz_n_1, D => image_cnt_60hz_n_41, Q => image_color_cnt_inter(3));
  image_cnt_60hz_g624 : MOAI22D0BWP7T port map(A1 => image_cnt_60hz_n_39, A2 => image_color_cnt_inter(4), B1 => image_cnt_60hz_n_39, B2 => image_color_cnt_inter(4), ZN => image_cnt_60hz_n_44);
  image_cnt_60hz_state_reg : DFKCNQD1BWP7T port map(CP => clk, CN => image_cnt_60hz_n_0, D => image_cnt_60hz_n_42, Q => image_flick_enable);
  image_cnt_60hz_g626 : IND2D1BWP7T port map(A1 => image_cnt_60hz_n_39, B1 => image_color_cnt_inter(4), ZN => image_cnt_60hz_n_43);
  image_cnt_60hz_color_cnt_in_reg_2 : DFKCNQD1BWP7T port map(CP => clk, CN => image_cnt_60hz_n_1, D => image_cnt_60hz_n_37, Q => image_color_cnt_inter(2));
  image_cnt_60hz_g628 : OAI221D0BWP7T port map(A1 => image_cnt_60hz_n_3, A2 => image_flick_enable, B1 => image_cnt_60hz_color_cnt_in(8), B2 => image_cnt_60hz_n_38, C => image_cnt_60hz_color_cnt_in(9), ZN => image_cnt_60hz_n_42);
  image_cnt_60hz_g629 : MOAI22D0BWP7T port map(A1 => image_cnt_60hz_n_36, A2 => image_color_cnt_inter(3), B1 => image_cnt_60hz_n_36, B2 => image_color_cnt_inter(3), ZN => image_cnt_60hz_n_41);
  image_cnt_60hz_g630 : IND2D1BWP7T port map(A1 => image_cnt_60hz_n_36, B1 => image_color_cnt_inter(3), ZN => image_cnt_60hz_n_39);
  image_cnt_60hz_color_cnt_in_reg_1 : DFKCNQD1BWP7T port map(CP => clk, CN => image_cnt_60hz_n_1, D => image_cnt_60hz_n_34, Q => image_color_cnt_inter(1));
  image_cnt_60hz_g632 : AN4D0BWP7T port map(A1 => image_cnt_60hz_n_35, A2 => image_cnt_60hz_color_cnt_in(7), A3 => image_flick_enable, A4 => image_color_cnt_inter(6), Z => image_cnt_60hz_n_38);
  image_cnt_60hz_g633 : MOAI22D0BWP7T port map(A1 => image_cnt_60hz_n_11, A2 => image_color_cnt_inter(2), B1 => image_cnt_60hz_n_11, B2 => image_color_cnt_inter(2), ZN => image_cnt_60hz_n_37);
  image_cnt_60hz_g634 : IND2D1BWP7T port map(A1 => image_cnt_60hz_n_11, B1 => image_color_cnt_inter(2), ZN => image_cnt_60hz_n_36);
  image_cnt_60hz_color_cnt_in_reg_0 : DFKCNQD1BWP7T port map(CP => clk, CN => image_cnt_60hz_n_1, D => image_cnt_60hz_n_4, Q => image_color_cnt_inter(0));
  image_cnt_60hz_g636 : AN4D0BWP7T port map(A1 => image_cnt_60hz_n_6, A2 => image_color_cnt_inter(3), A3 => image_color_cnt_inter(4), A4 => image_color_cnt_inter(5), Z => image_cnt_60hz_n_35);
  image_cnt_60hz_g637 : MOAI22D0BWP7T port map(A1 => image_cnt_60hz_n_2, A2 => image_color_cnt_inter(1), B1 => image_cnt_60hz_n_2, B2 => image_color_cnt_inter(1), ZN => image_cnt_60hz_n_34);
  image_cnt_60hz_g638 : IND2D1BWP7T port map(A1 => image_cnt_60hz_n_2, B1 => image_color_cnt_inter(1), ZN => image_cnt_60hz_n_11);
  image_cnt_60hz_g639 : AO21D0BWP7T port map(A1 => image_color_cnt_inter(1), A2 => image_color_cnt_inter(0), B => image_color_cnt_inter(2), Z => image_cnt_60hz_n_6);
  image_cnt_60hz_g640 : CKXOR2D1BWP7T port map(A1 => pulse_60hz, A2 => image_color_cnt_inter(0), Z => image_cnt_60hz_n_4);
  image_cnt_60hz_g641 : INR2D1BWP7T port map(A1 => image_cnt_60hz_color_cnt_in(7), B1 => flicker_in, ZN => image_cnt_60hz_n_3);
  image_cnt_60hz_g642 : ND2D1BWP7T port map(A1 => pulse_60hz, A2 => image_color_cnt_inter(0), ZN => image_cnt_60hz_n_2);
  image_cnt_60hz_g643 : AN2D1BWP7T port map(A1 => image_flick_enable, A2 => image_cnt_60hz_n_0, Z => image_cnt_60hz_n_1);
  image_cnt_60hz_g647 : INVD0BWP7T port map(I => reset, ZN => image_cnt_60hz_n_0);
  vga_ctrl_g8 : AN2D0BWP7T port map(A1 => vga_ctrl_h_video_on, A2 => vga_ctrl_v_video_on, Z => video_on);
  vga_ctrl_h_ctrl_g427 : OR2D4BWP7T port map(A1 => vga_ctrl_h_ctrl_n_19, A2 => vga_ctrl_h_video_on, Z => h_sync);
  vga_ctrl_h_ctrl_g428 : NR2XD0BWP7T port map(A1 => vga_ctrl_h_video_on, A2 => vga_ctrl_h_ctrl_n_17, ZN => vga_ctrl_h_count_reset);
  vga_ctrl_h_ctrl_g429 : IAO21D0BWP7T port map(A1 => vga_ctrl_h_ctrl_n_17, A2 => vga_ctrl_h_ctrl_n_18, B => vga_ctrl_h_ctrl_state(0), ZN => vga_ctrl_h_ctrl_n_19);
  vga_ctrl_h_ctrl_g430 : INR3D0BWP7T port map(A1 => vga_ctrl_h_ctrl_state(0), B1 => vga_ctrl_h_ctrl_state(2), B2 => vga_ctrl_h_ctrl_state(1), ZN => vga_ctrl_h_video_on);
  vga_ctrl_h_ctrl_g431 : INR2XD0BWP7T port map(A1 => vga_ctrl_h_ctrl_state(2), B1 => vga_ctrl_h_ctrl_state(1), ZN => vga_ctrl_h_ctrl_n_18);
  vga_ctrl_h_ctrl_g432 : INR2D1BWP7T port map(A1 => vga_ctrl_h_ctrl_state(1), B1 => vga_ctrl_h_ctrl_state(2), ZN => vga_ctrl_h_ctrl_n_17);
  vga_ctrl_h_ctrl_state_reg_1 : DFQD1BWP7T port map(CP => clk, D => vga_ctrl_h_ctrl_n_16, Q => vga_ctrl_h_ctrl_state(1));
  vga_ctrl_h_ctrl_g766 : OAI31D0BWP7T port map(A1 => reset, A2 => vga_ctrl_h_ctrl_n_3, A3 => vga_ctrl_h_ctrl_n_14, B => vga_ctrl_h_ctrl_n_10, ZN => vga_ctrl_h_ctrl_n_16);
  vga_ctrl_h_ctrl_state_reg_0 : DFQD1BWP7T port map(CP => clk, D => vga_ctrl_h_ctrl_n_15, Q => vga_ctrl_h_ctrl_state(0));
  vga_ctrl_h_ctrl_g768 : IND3D1BWP7T port map(A1 => vga_ctrl_h_ctrl_n_14, B1 => vga_ctrl_h_ctrl_n_11, B2 => vga_ctrl_h_ctrl_n_13, ZN => vga_ctrl_h_ctrl_n_15);
  vga_ctrl_h_ctrl_g769 : IAO21D0BWP7T port map(A1 => vga_ctrl_h_ctrl_n_12, A2 => vga_ctrl_h_ctrl_state(2), B => reset, ZN => vga_ctrl_h_ctrl_n_14);
  vga_ctrl_h_ctrl_g770 : IND4D0BWP7T port map(A1 => reset, B1 => vga_ctrl_h_ctrl_state(0), B2 => vga_ctrl_h_ctrl_state(1), B3 => vga_ctrl_h_ctrl_n_8, ZN => vga_ctrl_h_ctrl_n_13);
  vga_ctrl_h_ctrl_g771 : MOAI22D0BWP7T port map(A1 => vga_ctrl_h_ctrl_state(0), A2 => vga_ctrl_h_ctrl_state(1), B1 => vga_ctrl_h_ctrl_n_9, B2 => vga_ctrl_h_video_on, ZN => vga_ctrl_h_ctrl_n_12);
  vga_ctrl_h_ctrl_state_reg_2 : DFKCNQD1BWP7T port map(CP => clk, CN => vga_ctrl_h_ctrl_n_3, D => vga_ctrl_h_ctrl_n_7, Q => vga_ctrl_h_ctrl_state(2));
  vga_ctrl_h_ctrl_g773 : ND4D0BWP7T port map(A1 => vga_ctrl_h_ctrl_n_5, A2 => vga_ctrl_h_ctrl_n_3, A3 => vga_ctrl_h_ctrl_n_0, A4 => h_count(6), ZN => vga_ctrl_h_ctrl_n_11);
  vga_ctrl_h_ctrl_g774 : IND2D1BWP7T port map(A1 => vga_ctrl_h_ctrl_n_7, B1 => vga_ctrl_h_ctrl_n_3, ZN => vga_ctrl_h_ctrl_n_10);
  vga_ctrl_h_ctrl_g775 : IND4D0BWP7T port map(A1 => h_count(6), B1 => h_count(5), B2 => vga_ctrl_h_ctrl_n_0, B3 => vga_ctrl_h_ctrl_n_4, ZN => vga_ctrl_h_ctrl_n_9);
  vga_ctrl_h_ctrl_g776 : ND2D1BWP7T port map(A1 => vga_ctrl_h_ctrl_n_5, A2 => vga_ctrl_h_ctrl_n_2, ZN => vga_ctrl_h_ctrl_n_8);
  vga_ctrl_h_ctrl_g777 : NR2XD0BWP7T port map(A1 => vga_ctrl_h_ctrl_n_6, A2 => h_count(5), ZN => vga_ctrl_h_ctrl_n_7);
  vga_ctrl_h_ctrl_g778 : ND2D1BWP7T port map(A1 => vga_ctrl_h_ctrl_n_4, A2 => vga_ctrl_h_ctrl_n_2, ZN => vga_ctrl_h_ctrl_n_6);
  vga_ctrl_h_ctrl_g779 : NR3D0BWP7T port map(A1 => vga_ctrl_h_ctrl_n_1, A2 => h_count(5), A3 => h_count(3), ZN => vga_ctrl_h_ctrl_n_5);
  vga_ctrl_h_ctrl_g780 : INR2XD0BWP7T port map(A1 => h_count(3), B1 => vga_ctrl_h_ctrl_n_1, ZN => vga_ctrl_h_ctrl_n_4);
  vga_ctrl_h_ctrl_g781 : INR4D0BWP7T port map(A1 => vga_ctrl_h_ctrl_state(1), B1 => reset, B2 => vga_ctrl_h_ctrl_state(0), B3 => vga_ctrl_h_ctrl_state(2), ZN => vga_ctrl_h_ctrl_n_3);
  vga_ctrl_h_ctrl_g782 : INR3D0BWP7T port map(A1 => h_count(7), B1 => h_count(6), B2 => h_count(4), ZN => vga_ctrl_h_ctrl_n_2);
  vga_ctrl_h_ctrl_g783 : IND4D0BWP7T port map(A1 => h_count(0), B1 => h_count(1), B2 => h_count(2), B3 => h_count(8), ZN => vga_ctrl_h_ctrl_n_1);
  vga_ctrl_h_ctrl_g784 : INR2XD0BWP7T port map(A1 => h_count(4), B1 => h_count(7), ZN => vga_ctrl_h_ctrl_n_0);
  vga_ctrl_h_cnt_count_reg_8 : DFKCNQD1BWP7T port map(CP => clk, CN => vga_ctrl_h_cnt_n_1, D => vga_ctrl_h_cnt_n_16, Q => h_count(8));
  vga_ctrl_h_cnt_count_reg_7 : DFKCNQD1BWP7T port map(CP => clk, CN => vga_ctrl_h_cnt_n_1, D => vga_ctrl_h_cnt_n_15, Q => h_count(7));
  vga_ctrl_h_cnt_g152 : MOAI22D0BWP7T port map(A1 => vga_ctrl_h_cnt_n_14, A2 => h_count(8), B1 => vga_ctrl_h_cnt_n_14, B2 => h_count(8), ZN => vga_ctrl_h_cnt_n_16);
  vga_ctrl_h_cnt_count_reg_6 : DFKCNQD1BWP7T port map(CP => clk, CN => vga_ctrl_h_cnt_n_1, D => vga_ctrl_h_cnt_n_13, Q => h_count(6));
  vga_ctrl_h_cnt_g154 : MOAI22D0BWP7T port map(A1 => vga_ctrl_h_cnt_n_12, A2 => h_count(7), B1 => vga_ctrl_h_cnt_n_12, B2 => h_count(7), ZN => vga_ctrl_h_cnt_n_15);
  vga_ctrl_h_cnt_g155 : IND2D1BWP7T port map(A1 => vga_ctrl_h_cnt_n_12, B1 => h_count(7), ZN => vga_ctrl_h_cnt_n_14);
  vga_ctrl_h_cnt_count_reg_5 : DFKCNQD1BWP7T port map(CP => clk, CN => vga_ctrl_h_cnt_n_1, D => vga_ctrl_h_cnt_n_11, Q => h_count(5));
  vga_ctrl_h_cnt_g157 : MOAI22D0BWP7T port map(A1 => vga_ctrl_h_cnt_n_10, A2 => h_count(6), B1 => vga_ctrl_h_cnt_n_10, B2 => h_count(6), ZN => vga_ctrl_h_cnt_n_13);
  vga_ctrl_h_cnt_g158 : IND2D1BWP7T port map(A1 => vga_ctrl_h_cnt_n_10, B1 => h_count(6), ZN => vga_ctrl_h_cnt_n_12);
  vga_ctrl_h_cnt_count_reg_4 : DFKCNQD1BWP7T port map(CP => clk, CN => vga_ctrl_h_cnt_n_1, D => vga_ctrl_h_cnt_n_9, Q => h_count(4));
  vga_ctrl_h_cnt_g160 : MOAI22D0BWP7T port map(A1 => vga_ctrl_h_cnt_n_8, A2 => h_count(5), B1 => vga_ctrl_h_cnt_n_8, B2 => h_count(5), ZN => vga_ctrl_h_cnt_n_11);
  vga_ctrl_h_cnt_g161 : IND2D1BWP7T port map(A1 => vga_ctrl_h_cnt_n_8, B1 => h_count(5), ZN => vga_ctrl_h_cnt_n_10);
  vga_ctrl_h_cnt_count_reg_3 : DFKCNQD1BWP7T port map(CP => clk, CN => vga_ctrl_h_cnt_n_7, D => vga_ctrl_h_cnt_n_1, Q => h_count(3));
  vga_ctrl_h_cnt_g163 : MOAI22D0BWP7T port map(A1 => vga_ctrl_h_cnt_n_6, A2 => h_count(4), B1 => vga_ctrl_h_cnt_n_6, B2 => h_count(4), ZN => vga_ctrl_h_cnt_n_9);
  vga_ctrl_h_cnt_g164 : IND2D1BWP7T port map(A1 => vga_ctrl_h_cnt_n_6, B1 => h_count(4), ZN => vga_ctrl_h_cnt_n_8);
  vga_ctrl_h_cnt_count_reg_2 : DFKCNQD1BWP7T port map(CP => clk, CN => vga_ctrl_h_cnt_n_5, D => vga_ctrl_h_cnt_n_1, Q => h_count(2));
  vga_ctrl_h_cnt_g166 : MOAI22D0BWP7T port map(A1 => vga_ctrl_h_cnt_n_4, A2 => h_count(3), B1 => vga_ctrl_h_cnt_n_4, B2 => h_count(3), ZN => vga_ctrl_h_cnt_n_7);
  vga_ctrl_h_cnt_g167 : IND2D1BWP7T port map(A1 => vga_ctrl_h_cnt_n_4, B1 => h_count(3), ZN => vga_ctrl_h_cnt_n_6);
  vga_ctrl_h_cnt_count_reg_1 : DFKCNQD1BWP7T port map(CP => clk, CN => vga_ctrl_h_cnt_n_3, D => vga_ctrl_h_cnt_n_1, Q => h_count(1));
  vga_ctrl_h_cnt_g169 : MOAI22D0BWP7T port map(A1 => vga_ctrl_h_cnt_n_2, A2 => h_count(2), B1 => vga_ctrl_h_cnt_n_2, B2 => h_count(2), ZN => vga_ctrl_h_cnt_n_5);
  vga_ctrl_h_cnt_g170 : IND2D1BWP7T port map(A1 => vga_ctrl_h_cnt_n_2, B1 => h_count(2), ZN => vga_ctrl_h_cnt_n_4);
  vga_ctrl_h_cnt_g172 : MOAI22D0BWP7T port map(A1 => vga_ctrl_h_cnt_n_0, A2 => h_count(1), B1 => vga_ctrl_h_cnt_n_0, B2 => h_count(1), ZN => vga_ctrl_h_cnt_n_3);
  vga_ctrl_h_cnt_g173 : ND2D1BWP7T port map(A1 => h_count(0), A2 => h_count(1), ZN => vga_ctrl_h_cnt_n_2);
  vga_ctrl_h_cnt_g174 : INVD1BWP7T port map(I => vga_ctrl_h_count_reset, ZN => vga_ctrl_h_cnt_n_1);
  vga_ctrl_h_cnt_count_reg_0 : DFKCND1BWP7T port map(CP => clk, CN => vga_ctrl_h_cnt_n_0, D => vga_ctrl_h_cnt_n_1, Q => h_count(0), QN => vga_ctrl_h_cnt_n_0);
  vga_ctrl_v_ctrl_g673 : OR3D4BWP7T port map(A1 => vga_ctrl_v_ctrl_n_24, A2 => vga_ctrl_v_video_on, A3 => vga_ctrl_v_ctrl_n_29, Z => v_sync);
  vga_ctrl_v_ctrl_g674 : CKAN2D4BWP7T port map(A1 => vga_ctrl_v_ctrl_n_25, A2 => vga_ctrl_v_ctrl_n_23, Z => pulse_60hz);
  vga_ctrl_v_ctrl_g675 : NR2XD0BWP7T port map(A1 => vga_ctrl_v_ctrl_n_23, A2 => vga_ctrl_v_ctrl_state(0), ZN => vga_ctrl_v_ctrl_n_29);
  vga_ctrl_v_ctrl_g676 : CKND1BWP7T port map(I => vga_ctrl_v_video_on, ZN => vga_ctrl_v_ctrl_n_25);
  vga_ctrl_v_ctrl_g677 : INR3D0BWP7T port map(A1 => vga_ctrl_v_ctrl_state(2), B1 => vga_ctrl_v_ctrl_state(0), B2 => vga_ctrl_v_ctrl_state(1), ZN => vga_ctrl_v_ctrl_n_24);
  vga_ctrl_v_ctrl_g678 : INR3D0BWP7T port map(A1 => vga_ctrl_v_ctrl_state(0), B1 => vga_ctrl_v_ctrl_state(2), B2 => vga_ctrl_v_ctrl_state(1), ZN => vga_ctrl_v_video_on);
  vga_ctrl_v_ctrl_g679 : IND2D1BWP7T port map(A1 => vga_ctrl_v_ctrl_state(2), B1 => vga_ctrl_v_ctrl_state(1), ZN => vga_ctrl_v_ctrl_n_23);
  vga_ctrl_v_ctrl_state_reg_0 : DFQD1BWP7T port map(CP => clk, D => vga_ctrl_v_ctrl_n_21, Q => vga_ctrl_v_ctrl_state(0));
  vga_ctrl_v_ctrl_state_reg_1 : DFQD1BWP7T port map(CP => clk, D => vga_ctrl_v_ctrl_n_22, Q => vga_ctrl_v_ctrl_state(1));
  vga_ctrl_v_ctrl_g1544 : IINR4D0BWP7T port map(A1 => vga_ctrl_v_ctrl_n_20, A2 => vga_ctrl_v_ctrl_n_2, B1 => vga_ctrl_v_ctrl_n_18, B2 => reset, ZN => vga_ctrl_v_ctrl_n_22);
  vga_ctrl_v_ctrl_g1545 : OAI221D0BWP7T port map(A1 => vga_ctrl_v_ctrl_n_19, A2 => reset, B1 => vga_ctrl_v_ctrl_n_0, B2 => vga_ctrl_v_ctrl_n_16, C => vga_ctrl_v_ctrl_n_20, ZN => vga_ctrl_v_ctrl_n_21);
  vga_ctrl_v_ctrl_state_reg_2 : DFQD1BWP7T port map(CP => clk, D => vga_ctrl_v_ctrl_n_18, Q => vga_ctrl_v_ctrl_state(2));
  vga_ctrl_v_ctrl_g1547 : AOI31D0BWP7T port map(A1 => vga_ctrl_v_ctrl_n_16, A2 => vga_ctrl_v_ctrl_state(0), A3 => vga_ctrl_v_ctrl_state(1), B => vga_ctrl_v_ctrl_n_3, ZN => vga_ctrl_v_ctrl_n_19);
  vga_ctrl_v_ctrl_g1548 : IOA21D1BWP7T port map(A1 => vga_ctrl_v_ctrl_n_17, A2 => vga_ctrl_v_ctrl_n_0, B => vga_ctrl_v_video_on, ZN => vga_ctrl_v_ctrl_n_20);
  vga_ctrl_v_ctrl_g1549 : NR4D0BWP7T port map(A1 => vga_ctrl_v_ctrl_n_14, A2 => vga_ctrl_v_ctrl_n_0, A3 => v_count(5), A4 => v_count(0), ZN => vga_ctrl_v_ctrl_n_18);
  vga_ctrl_v_ctrl_g1550 : AO21D0BWP7T port map(A1 => vga_ctrl_v_ctrl_n_15, A2 => v_count(0), B => reset, Z => vga_ctrl_v_ctrl_n_17);
  vga_ctrl_v_ctrl_g1551 : IND3D1BWP7T port map(A1 => v_count(0), B1 => v_count(5), B2 => vga_ctrl_v_ctrl_n_13, ZN => vga_ctrl_v_ctrl_n_16);
  vga_ctrl_v_ctrl_g1552 : INR2XD0BWP7T port map(A1 => vga_ctrl_v_ctrl_n_13, B1 => v_count(5), ZN => vga_ctrl_v_ctrl_n_15);
  vga_ctrl_v_ctrl_g1553 : IIND4D0BWP7T port map(A1 => v_count(2), A2 => v_count(4), B1 => vga_ctrl_v_ctrl_n_12, B2 => v_count(3), ZN => vga_ctrl_v_ctrl_n_14);
  vga_ctrl_v_ctrl_g1554 : AN4D1BWP7T port map(A1 => vga_ctrl_v_ctrl_n_11, A2 => v_count(4), A3 => v_count(3), A4 => v_count(2), Z => vga_ctrl_v_ctrl_n_13);
  vga_ctrl_v_ctrl_g1555 : NR4D0BWP7T port map(A1 => vga_ctrl_v_ctrl_n_10, A2 => v_count(7), A3 => v_count(6), A4 => v_count(8), ZN => vga_ctrl_v_ctrl_n_12);
  vga_ctrl_v_ctrl_g1556 : AN4D0BWP7T port map(A1 => vga_ctrl_v_ctrl_n_9, A2 => v_count(8), A3 => v_count(7), A4 => v_count(6), Z => vga_ctrl_v_ctrl_n_11);
  vga_ctrl_v_ctrl_g1557 : IND4D0BWP7T port map(A1 => h_count(0), B1 => v_count(9), B2 => h_count(1), B3 => vga_ctrl_v_ctrl_n_7, ZN => vga_ctrl_v_ctrl_n_10);
  vga_ctrl_v_ctrl_g1558 : NR3D0BWP7T port map(A1 => vga_ctrl_v_ctrl_n_8, A2 => h_count(0), A3 => v_count(9), ZN => vga_ctrl_v_ctrl_n_9);
  vga_ctrl_v_ctrl_g1559 : IND4D0BWP7T port map(A1 => h_count(2), B1 => h_count(3), B2 => h_count(1), B3 => vga_ctrl_v_ctrl_n_5, ZN => vga_ctrl_v_ctrl_n_8);
  vga_ctrl_v_ctrl_g1560 : AN3D0BWP7T port map(A1 => vga_ctrl_v_ctrl_n_6, A2 => h_count(3), A3 => h_count(2), Z => vga_ctrl_v_ctrl_n_7);
  vga_ctrl_v_ctrl_g1561 : NR4D0BWP7T port map(A1 => vga_ctrl_v_ctrl_n_1, A2 => h_count(5), A3 => h_count(4), A4 => h_count(6), ZN => vga_ctrl_v_ctrl_n_6);
  vga_ctrl_v_ctrl_g1562 : NR2XD0BWP7T port map(A1 => vga_ctrl_v_ctrl_n_4, A2 => h_count(4), ZN => vga_ctrl_v_ctrl_n_5);
  vga_ctrl_v_ctrl_g1563 : IND4D0BWP7T port map(A1 => h_count(7), B1 => h_count(8), B2 => h_count(6), B3 => h_count(5), ZN => vga_ctrl_v_ctrl_n_4);
  vga_ctrl_v_ctrl_g1564 : INVD1BWP7T port map(I => vga_ctrl_v_ctrl_n_2, ZN => vga_ctrl_v_ctrl_n_3);
  vga_ctrl_v_ctrl_g1565 : IAO21D0BWP7T port map(A1 => vga_ctrl_v_ctrl_state(1), A2 => vga_ctrl_v_ctrl_state(0), B => vga_ctrl_v_ctrl_state(2), ZN => vga_ctrl_v_ctrl_n_2);
  vga_ctrl_v_ctrl_g1566 : ND3D0BWP7T port map(A1 => vga_ctrl_v_ctrl_n_29, A2 => h_count(8), A3 => h_count(7), ZN => vga_ctrl_v_ctrl_n_1);
  vga_ctrl_v_ctrl_g1567 : OR2D1BWP7T port map(A1 => v_count(1), A2 => reset, Z => vga_ctrl_v_ctrl_n_0);
  vga_ctrl_v_cnt_count_reg_9 : DFKCNQD1BWP7T port map(CP => clk, CN => vga_ctrl_v_cnt_n_0, D => vga_ctrl_v_cnt_n_19, Q => v_count(9));
  vga_ctrl_v_cnt_count_reg_8 : DFKCNQD1BWP7T port map(CP => clk, CN => vga_ctrl_v_cnt_n_0, D => vga_ctrl_v_cnt_n_18, Q => v_count(8));
  vga_ctrl_v_cnt_g174 : MOAI22D0BWP7T port map(A1 => vga_ctrl_v_cnt_n_17, A2 => v_count(9), B1 => vga_ctrl_v_cnt_n_17, B2 => v_count(9), ZN => vga_ctrl_v_cnt_n_19);
  vga_ctrl_v_cnt_count_reg_7 : DFKCNQD1BWP7T port map(CP => clk, CN => vga_ctrl_v_cnt_n_0, D => vga_ctrl_v_cnt_n_16, Q => v_count(7));
  vga_ctrl_v_cnt_g176 : MOAI22D0BWP7T port map(A1 => vga_ctrl_v_cnt_n_15, A2 => v_count(8), B1 => vga_ctrl_v_cnt_n_15, B2 => v_count(8), ZN => vga_ctrl_v_cnt_n_18);
  vga_ctrl_v_cnt_g177 : IND2D1BWP7T port map(A1 => vga_ctrl_v_cnt_n_15, B1 => v_count(8), ZN => vga_ctrl_v_cnt_n_17);
  vga_ctrl_v_cnt_count_reg_6 : DFKCNQD1BWP7T port map(CP => clk, CN => vga_ctrl_v_cnt_n_0, D => vga_ctrl_v_cnt_n_14, Q => v_count(6));
  vga_ctrl_v_cnt_g179 : MOAI22D0BWP7T port map(A1 => vga_ctrl_v_cnt_n_13, A2 => v_count(7), B1 => vga_ctrl_v_cnt_n_13, B2 => v_count(7), ZN => vga_ctrl_v_cnt_n_16);
  vga_ctrl_v_cnt_g180 : IND2D1BWP7T port map(A1 => vga_ctrl_v_cnt_n_13, B1 => v_count(7), ZN => vga_ctrl_v_cnt_n_15);
  vga_ctrl_v_cnt_count_reg_5 : DFKCNQD1BWP7T port map(CP => clk, CN => vga_ctrl_v_cnt_n_0, D => vga_ctrl_v_cnt_n_12, Q => v_count(5));
  vga_ctrl_v_cnt_g182 : MOAI22D0BWP7T port map(A1 => vga_ctrl_v_cnt_n_11, A2 => v_count(6), B1 => vga_ctrl_v_cnt_n_11, B2 => v_count(6), ZN => vga_ctrl_v_cnt_n_14);
  vga_ctrl_v_cnt_g183 : IND2D1BWP7T port map(A1 => vga_ctrl_v_cnt_n_11, B1 => v_count(6), ZN => vga_ctrl_v_cnt_n_13);
  vga_ctrl_v_cnt_count_reg_4 : DFKCNQD1BWP7T port map(CP => clk, CN => vga_ctrl_v_cnt_n_0, D => vga_ctrl_v_cnt_n_10, Q => v_count(4));
  vga_ctrl_v_cnt_g185 : MOAI22D0BWP7T port map(A1 => vga_ctrl_v_cnt_n_9, A2 => v_count(5), B1 => vga_ctrl_v_cnt_n_9, B2 => v_count(5), ZN => vga_ctrl_v_cnt_n_12);
  vga_ctrl_v_cnt_g186 : IND2D1BWP7T port map(A1 => vga_ctrl_v_cnt_n_9, B1 => v_count(5), ZN => vga_ctrl_v_cnt_n_11);
  vga_ctrl_v_cnt_count_reg_3 : DFKCNQD1BWP7T port map(CP => clk, CN => vga_ctrl_v_cnt_n_0, D => vga_ctrl_v_cnt_n_8, Q => v_count(3));
  vga_ctrl_v_cnt_g188 : MOAI22D0BWP7T port map(A1 => vga_ctrl_v_cnt_n_7, A2 => v_count(4), B1 => vga_ctrl_v_cnt_n_7, B2 => v_count(4), ZN => vga_ctrl_v_cnt_n_10);
  vga_ctrl_v_cnt_g189 : IND2D1BWP7T port map(A1 => vga_ctrl_v_cnt_n_7, B1 => v_count(4), ZN => vga_ctrl_v_cnt_n_9);
  vga_ctrl_v_cnt_count_reg_2 : DFKCNQD1BWP7T port map(CP => clk, CN => vga_ctrl_v_cnt_n_0, D => vga_ctrl_v_cnt_n_6, Q => v_count(2));
  vga_ctrl_v_cnt_g191 : MOAI22D0BWP7T port map(A1 => vga_ctrl_v_cnt_n_5, A2 => v_count(3), B1 => vga_ctrl_v_cnt_n_5, B2 => v_count(3), ZN => vga_ctrl_v_cnt_n_8);
  vga_ctrl_v_cnt_g192 : IND2D1BWP7T port map(A1 => vga_ctrl_v_cnt_n_5, B1 => v_count(3), ZN => vga_ctrl_v_cnt_n_7);
  vga_ctrl_v_cnt_count_reg_1 : DFKCNQD1BWP7T port map(CP => clk, CN => vga_ctrl_v_cnt_n_0, D => vga_ctrl_v_cnt_n_4, Q => v_count(1));
  vga_ctrl_v_cnt_g194 : MOAI22D0BWP7T port map(A1 => vga_ctrl_v_cnt_n_3, A2 => v_count(2), B1 => vga_ctrl_v_cnt_n_3, B2 => v_count(2), ZN => vga_ctrl_v_cnt_n_6);
  vga_ctrl_v_cnt_g195 : IND2D1BWP7T port map(A1 => vga_ctrl_v_cnt_n_3, B1 => v_count(2), ZN => vga_ctrl_v_cnt_n_5);
  vga_ctrl_v_cnt_count_reg_0 : DFKCNQD1BWP7T port map(CP => clk, CN => vga_ctrl_v_cnt_n_0, D => vga_ctrl_v_cnt_n_2, Q => v_count(0));
  vga_ctrl_v_cnt_g197 : MOAI22D0BWP7T port map(A1 => vga_ctrl_v_cnt_n_1, A2 => v_count(1), B1 => vga_ctrl_v_cnt_n_1, B2 => v_count(1), ZN => vga_ctrl_v_cnt_n_4);
  vga_ctrl_v_cnt_g198 : IND2D1BWP7T port map(A1 => vga_ctrl_v_cnt_n_1, B1 => v_count(1), ZN => vga_ctrl_v_cnt_n_3);
  vga_ctrl_v_cnt_g199 : CKXOR2D1BWP7T port map(A1 => vga_ctrl_h_count_reset, A2 => v_count(0), Z => vga_ctrl_v_cnt_n_2);
  vga_ctrl_v_cnt_g200 : ND2D1BWP7T port map(A1 => vga_ctrl_h_count_reset, A2 => v_count(0), ZN => vga_ctrl_v_cnt_n_1);
  vga_ctrl_v_cnt_g201 : INVD1BWP7T port map(I => pulse_60hz, ZN => vga_ctrl_v_cnt_n_0);
  image_snake_g1359 : INR2XD0BWP7T port map(A1 => image_snake_state(0), B1 => image_snake_state(1), ZN => image_snake_inter);
  image_snake_g1360 : AN2D4BWP7T port map(A1 => image_snake_n_338, A2 => image_snake_state(1), Z => clr_flag);
  image_snake_state_reg_1 : DFQD1BWP7T port map(CP => clk, D => image_snake_n_336, Q => image_snake_state(1));
  image_snake_g4874 : NR3D0BWP7T port map(A1 => image_snake_n_335, A2 => image_snake_state(1), A3 => reset, ZN => image_snake_n_337);
  image_snake_g4876 : INR3D0BWP7T port map(A1 => image_snake_inter, B1 => reset, B2 => image_snake_n_334, ZN => image_snake_n_336);
  image_snake_g4877 : AOI21D0BWP7T port map(A1 => image_snake_n_334, A2 => image_snake_state(0), B => image_snake_n_333, ZN => image_snake_n_335);
  image_snake_g4878 : OAI21D0BWP7T port map(A1 => image_snake_n_332, A2 => image_snake_n_330, B => image_snake_n_321, ZN => image_snake_n_334);
  image_snake_g4879 : NR4D0BWP7T port map(A1 => image_snake_n_320, A2 => image_snake_n_332, A3 => image_snake_n_318, A4 => image_snake_state(0), ZN => image_snake_n_333);
  image_snake_g4880 : AOI21D0BWP7T port map(A1 => image_snake_n_331, A2 => image_snake_n_323, B => image_snake_n_324, ZN => image_snake_n_332);
  image_snake_g4881 : OAI211D1BWP7T port map(A1 => h_count(7), A2 => image_snake_n_316, B => image_snake_n_328, C => image_snake_n_329, ZN => image_snake_n_331);
  image_snake_g4882 : INR4D0BWP7T port map(A1 => image_snake_n_316, B1 => image_snake_n_197, B2 => image_snake_n_325, B3 => image_snake_n_327, ZN => image_snake_n_330);
  image_snake_g4883 : AOI221D0BWP7T port map(A1 => image_snake_n_326, A2 => image_snake_n_310, B1 => image_snake_n_322, B2 => image_snake_n_315, C => image_snake_n_325, ZN => image_snake_n_329);
  image_snake_g4884 : ND3D0BWP7T port map(A1 => image_snake_n_288, A2 => image_snake_n_326, A3 => image_snake_n_303, ZN => image_snake_n_328);
  image_snake_g4885 : IND2D1BWP7T port map(A1 => image_snake_n_324, B1 => image_snake_n_314, ZN => image_snake_n_327);
  image_snake_g4886 : AOI22D0BWP7T port map(A1 => image_snake_n_319, A2 => h_count(7), B1 => image_snake_n_306, B2 => h_count(6), ZN => image_snake_n_326);
  image_snake_g4887 : NR2D1BWP7T port map(A1 => image_snake_n_319, A2 => h_count(7), ZN => image_snake_n_325);
  image_snake_g4888 : ND2D1BWP7T port map(A1 => image_snake_n_317, A2 => h_count(8), ZN => image_snake_n_323);
  image_snake_g4889 : NR2XD0BWP7T port map(A1 => image_snake_n_317, A2 => h_count(8), ZN => image_snake_n_324);
  image_snake_g4890 : INVD0BWP7T port map(I => image_snake_n_319, ZN => image_snake_n_322);
  image_snake_g4891 : AO21D0BWP7T port map(A1 => image_snake_n_302, A2 => image_snake_n_290, B => image_snake_n_318, Z => image_snake_n_321);
  image_snake_g4892 : OAI211D1BWP7T port map(A1 => image_snake_n_232, A2 => image_snake_n_229, B => image_snake_n_312, C => image_snake_n_313, ZN => image_snake_n_320);
  image_snake_g4893 : OAI21D0BWP7T port map(A1 => image_snake_n_308, A2 => snake_x_loc(9), B => image_snake_n_317, ZN => image_snake_n_319);
  image_snake_g4894 : AO21D0BWP7T port map(A1 => image_snake_n_283, A2 => v_count(9), B => image_snake_n_311, Z => image_snake_n_318);
  image_snake_g4895 : INVD0BWP7T port map(I => image_snake_n_315, ZN => image_snake_n_316);
  image_snake_g4896 : NR4D0BWP7T port map(A1 => image_snake_n_304, A2 => image_snake_n_254, A3 => image_snake_n_238, A4 => image_snake_n_281, ZN => image_snake_n_314);
  image_snake_g4897 : ND2D1BWP7T port map(A1 => image_snake_n_308, A2 => snake_x_loc(9), ZN => image_snake_n_317);
  image_snake_g4898 : NR2D1BWP7T port map(A1 => image_snake_n_306, A2 => h_count(6), ZN => image_snake_n_315);
  image_snake_g4899 : AOI21D0BWP7T port map(A1 => image_snake_n_231, A2 => image_snake_n_233, B => image_snake_n_309, ZN => image_snake_n_313);
  image_snake_g4900 : OAI221D0BWP7T port map(A1 => image_snake_n_231, A2 => image_snake_n_233, B1 => image_snake_n_228, B2 => image_snake_n_250, C => image_snake_n_307, ZN => image_snake_n_312);
  image_snake_g4901 : MOAI22D0BWP7T port map(A1 => image_snake_n_296, A2 => image_snake_n_298, B1 => image_snake_n_305, B2 => image_snake_n_302, ZN => image_snake_n_311);
  image_snake_g4902 : AO21D0BWP7T port map(A1 => image_snake_n_303, A2 => image_snake_n_281, B => image_snake_n_304, Z => image_snake_n_310);
  image_snake_g4903 : AOI221D0BWP7T port map(A1 => image_snake_n_229, A2 => image_snake_n_232, B1 => image_snake_n_245, B2 => image_snake_n_230, C => image_snake_n_301, ZN => image_snake_n_309);
  image_snake_g4904 : OAI21D0BWP7T port map(A1 => image_snake_n_297, A2 => image_snake_n_289, B => image_snake_n_277, ZN => image_snake_n_307);
  image_snake_g4905 : OAI21D0BWP7T port map(A1 => image_snake_n_299, A2 => image_snake_n_239, B => image_snake_n_237, ZN => image_snake_n_308);
  image_snake_g4906 : AO221D0BWP7T port map(A1 => v_count(6), A2 => image_snake_n_268, B1 => v_count(5), B2 => image_snake_n_267, C => image_snake_n_295, Z => image_snake_n_305);
  image_snake_g4907 : MOAI22D0BWP7T port map(A1 => image_snake_n_299, A2 => image_snake_n_247, B1 => image_snake_n_299, B2 => image_snake_n_247, ZN => image_snake_n_306);
  image_snake_g4908 : NR2D1BWP7T port map(A1 => image_snake_n_300, A2 => h_count(5), ZN => image_snake_n_304);
  image_snake_g4909 : ND2D1BWP7T port map(A1 => image_snake_n_300, A2 => h_count(5), ZN => image_snake_n_303);
  image_snake_g4910 : MAOI22D0BWP7T port map(A1 => image_snake_n_294, A2 => image_snake_n_292, B1 => image_snake_n_245, B2 => image_snake_n_230, ZN => image_snake_n_301);
  image_snake_g4911 : NR2D1BWP7T port map(A1 => image_snake_n_298, A2 => image_snake_n_291, ZN => image_snake_n_302);
  image_snake_g4912 : FA1D0BWP7T port map(A => image_snake_n_205, B => image_snake_n_195, CI => image_snake_n_271, CO => image_snake_n_299, S => image_snake_n_300);
  image_snake_g4913 : OAI21D0BWP7T port map(A1 => image_snake_n_264, A2 => image_snake_n_261, B => image_snake_n_293, ZN => image_snake_n_297);
  image_snake_g4914 : OAI22D0BWP7T port map(A1 => image_snake_n_285, A2 => v_count(8), B1 => v_count(9), B2 => image_snake_n_283, ZN => image_snake_n_298);
  image_snake_g4915 : AOI22D0BWP7T port map(A1 => v_count(7), A2 => image_snake_n_284, B1 => image_snake_n_285, B2 => v_count(8), ZN => image_snake_n_296);
  image_snake_g4916 : MOAI22D0BWP7T port map(A1 => image_snake_n_280, A2 => image_snake_n_286, B1 => image_snake_n_290, B2 => image_snake_n_218, ZN => image_snake_n_295);
  image_snake_g4917 : OAI31D0BWP7T port map(A1 => image_snake_n_252, A2 => image_snake_n_275, A3 => image_snake_n_287, B => image_snake_n_246, ZN => image_snake_n_294);
  image_snake_g4918 : AOI31D0BWP7T port map(A1 => image_snake_n_282, A2 => v_count(3), A3 => image_snake_n_46, B => image_snake_n_278, ZN => image_snake_n_293);
  image_snake_g4919 : OAI21D0BWP7T port map(A1 => image_snake_n_287, A2 => image_snake_n_275, B => image_snake_n_252, ZN => image_snake_n_292);
  image_snake_g4920 : OAI22D0BWP7T port map(A1 => v_count(7), A2 => image_snake_n_284, B1 => v_count(6), B2 => image_snake_n_268, ZN => image_snake_n_291);
  image_snake_g4921 : NR2D1BWP7T port map(A1 => image_snake_n_286, A2 => image_snake_n_240, ZN => image_snake_n_290);
  image_snake_g4922 : MOAI22D0BWP7T port map(A1 => image_snake_n_263, A2 => image_snake_n_249, B1 => image_snake_n_282, B2 => image_snake_n_217, ZN => image_snake_n_289);
  image_snake_g4923 : AOI222D0BWP7T port map(A1 => h_count(4), A2 => image_snake_n_276, B1 => image_snake_n_251, B2 => image_snake_n_255, C1 => h_count(3), C2 => image_snake_n_243, ZN => image_snake_n_288);
  image_snake_g4924 : AOI31D0BWP7T port map(A1 => image_snake_n_227, A2 => image_snake_n_212, A3 => snake_x_loc(0), B => image_snake_n_279, ZN => image_snake_n_287);
  image_snake_g4925 : OAI22D0BWP7T port map(A1 => v_count(5), A2 => image_snake_n_267, B1 => v_count(4), B2 => image_snake_n_259, ZN => image_snake_n_286);
  image_snake_g4926 : MAOI22D0BWP7T port map(A1 => image_snake_n_272, A2 => snake_y_loc(9), B1 => image_snake_n_272, B2 => snake_y_loc(9), ZN => image_snake_n_285);
  image_snake_g4927 : MOAI22D0BWP7T port map(A1 => image_snake_n_269, A2 => image_snake_n_242, B1 => image_snake_n_269, B2 => image_snake_n_242, ZN => image_snake_n_284);
  image_snake_g4928 : IND2D1BWP7T port map(A1 => image_snake_n_272, B1 => snake_y_loc(9), ZN => image_snake_n_283);
  image_snake_g4929 : AN2D0BWP7T port map(A1 => image_snake_n_273, A2 => image_snake_n_266, Z => image_snake_n_282);
  image_snake_g4930 : NR2D0BWP7T port map(A1 => h_count(4), A2 => image_snake_n_276, ZN => image_snake_n_281);
  image_snake_g4931 : AOI22D0BWP7T port map(A1 => v_count(4), A2 => image_snake_n_259, B1 => v_count(3), B2 => image_snake_n_209, ZN => image_snake_n_280);
  image_snake_g4932 : IOA21D0BWP7T port map(A1 => image_snake_n_257, A2 => image_snake_n_265, B => image_snake_n_270, ZN => image_snake_n_279);
  image_snake_g4933 : AOI211D1BWP7T port map(A1 => image_snake_n_224, A2 => snake_y_loc(0), B => image_snake_n_274, C => image_snake_n_262, ZN => image_snake_n_278);
  image_snake_g4934 : AOI22D0BWP7T port map(A1 => image_snake_n_263, A2 => image_snake_n_249, B1 => image_snake_n_250, B2 => image_snake_n_228, ZN => image_snake_n_277);
  image_snake_g4935 : CKND1BWP7T port map(I => image_snake_n_273, ZN => image_snake_n_274);
  image_snake_g4936 : FA1D0BWP7T port map(A => image_snake_n_215, B => image_snake_n_0, CI => image_snake_n_204, CO => image_snake_n_271, S => image_snake_n_276);
  image_snake_g4937 : OAI31D0BWP7T port map(A1 => snake_x_loc(0), A2 => image_snake_n_185, A3 => image_snake_n_212, B => image_snake_n_260, ZN => image_snake_n_270);
  image_snake_g4938 : NR2D1BWP7T port map(A1 => image_snake_n_257, A2 => image_snake_n_265, ZN => image_snake_n_275);
  image_snake_g4939 : ND2D1BWP7T port map(A1 => image_snake_n_264, A2 => image_snake_n_261, ZN => image_snake_n_273);
  image_snake_g4940 : AOI31D0BWP7T port map(A1 => image_snake_n_253, A2 => image_snake_n_202, A3 => snake_y_loc(8), B => image_snake_n_236, ZN => image_snake_n_272);
  image_snake_g4941 : OAI21D0BWP7T port map(A1 => image_snake_n_224, A2 => snake_y_loc(0), B => image_snake_n_262, ZN => image_snake_n_266);
  image_snake_g4942 : AOI21D0BWP7T port map(A1 => image_snake_n_256, A2 => image_snake_n_235, B => image_snake_n_236, ZN => image_snake_n_269);
  image_snake_g4943 : MAOI22D0BWP7T port map(A1 => image_snake_n_256, A2 => image_snake_n_248, B1 => image_snake_n_256, B2 => image_snake_n_248, ZN => image_snake_n_268);
  image_snake_g4944 : MOAI22D0BWP7T port map(A1 => image_snake_n_258, A2 => image_snake_n_219, B1 => image_snake_n_258, B2 => image_snake_n_219, ZN => image_snake_n_267);
  image_snake_g4945 : FA1D0BWP7T port map(A => image_snake_n_194, B => snake_x_loc(1), CI => image_snake_n_216, CO => image_snake_n_265, S => image_snake_n_260);
  image_snake_g4946 : FA1D0BWP7T port map(A => image_snake_n_191, B => snake_y_loc(2), CI => image_snake_n_206, CO => image_snake_n_263, S => image_snake_n_264);
  image_snake_g4947 : FA1D0BWP7T port map(A => image_snake_n_186, B => snake_y_loc(1), CI => image_snake_n_214, CO => image_snake_n_261, S => image_snake_n_262);
  image_snake_g4948 : MOAI22D0BWP7T port map(A1 => image_snake_n_241, A2 => snake_y_loc(5), B1 => image_snake_n_241, B2 => snake_y_loc(5), ZN => image_snake_n_259);
  image_snake_g4949 : OA21D0BWP7T port map(A1 => snake_y_loc(7), A2 => image_snake_n_2, B => image_snake_n_241, Z => image_snake_n_258);
  image_snake_g4950 : MAOI22D0BWP7T port map(A1 => image_snake_n_244, A2 => image_snake_n_187, B1 => image_snake_n_244, B2 => image_snake_n_187, ZN => image_snake_n_257);
  image_snake_g4951 : OAI22D0BWP7T port map(A1 => image_snake_n_219, A2 => image_snake_n_201, B1 => image_snake_n_188, B2 => image_snake_n_181, ZN => image_snake_n_256);
  image_snake_g4952 : INVD0BWP7T port map(I => image_snake_n_254, ZN => image_snake_n_255);
  image_snake_g4953 : OAI21D0BWP7T port map(A1 => image_snake_n_234, A2 => image_snake_n_219, B => image_snake_n_190, ZN => image_snake_n_253);
  image_snake_g4954 : NR2XD0BWP7T port map(A1 => h_count(3), A2 => image_snake_n_243, ZN => image_snake_n_254);
  image_snake_g4955 : MOAI22D0BWP7T port map(A1 => image_snake_n_226, A2 => image_snake_n_238, B1 => h_count(2), B2 => image_snake_n_211, ZN => image_snake_n_251);
  image_snake_g4956 : MAOI222D1BWP7T port map(A => image_snake_n_207, B => image_snake_n_187, C => snake_x_loc(2), ZN => image_snake_n_252);
  image_snake_g4957 : OAI21D0BWP7T port map(A1 => image_snake_n_225, A2 => image_snake_n_199, B => image_snake_n_230, ZN => image_snake_n_246);
  image_snake_g4958 : AOI21D0BWP7T port map(A1 => image_snake_n_210, A2 => image_snake_n_189, B => image_snake_n_231, ZN => image_snake_n_250);
  image_snake_g4959 : AOI21D0BWP7T port map(A1 => image_snake_n_220, A2 => image_snake_n_193, B => image_snake_n_228, ZN => image_snake_n_249);
  image_snake_g4960 : IND2D1BWP7T port map(A1 => image_snake_n_236, B1 => image_snake_n_235, ZN => image_snake_n_248);
  image_snake_g4961 : IND2D1BWP7T port map(A1 => image_snake_n_239, B1 => image_snake_n_237, ZN => image_snake_n_247);
  image_snake_g4962 : OAI22D0BWP7T port map(A1 => v_count(3), A2 => image_snake_n_209, B1 => v_count(2), B2 => snake_y_loc(5), ZN => image_snake_n_240);
  image_snake_g4963 : OAI21D0BWP7T port map(A1 => image_snake_n_213, A2 => image_snake_n_192, B => image_snake_n_229, ZN => image_snake_n_245);
  image_snake_g4964 : MOAI22D0BWP7T port map(A1 => image_snake_n_207, A2 => image_snake_n_15, B1 => image_snake_n_207, B2 => image_snake_n_15, ZN => image_snake_n_244);
  image_snake_g4965 : MOAI22D0BWP7T port map(A1 => image_snake_n_200, A2 => snake_x_loc(7), B1 => image_snake_n_200, B2 => snake_x_loc(7), ZN => image_snake_n_243);
  image_snake_g4966 : MAOI22D0BWP7T port map(A1 => image_snake_n_190, A2 => snake_y_loc(8), B1 => image_snake_n_190, B2 => snake_y_loc(8), ZN => image_snake_n_242);
  image_snake_g4967 : MAOI22D0BWP7T port map(A1 => image_snake_n_188, A2 => snake_y_loc(7), B1 => image_snake_n_188, B2 => snake_y_loc(7), ZN => image_snake_n_241);
  image_snake_g4968 : INVD1BWP7T port map(I => image_snake_n_235, ZN => image_snake_n_234);
  image_snake_g4969 : INR2D1BWP7T port map(A1 => image_snake_n_203, B1 => snake_x_loc(8), ZN => image_snake_n_239);
  image_snake_g4970 : NR2XD0BWP7T port map(A1 => h_count(2), A2 => image_snake_n_211, ZN => image_snake_n_238);
  image_snake_g4971 : IND2D1BWP7T port map(A1 => image_snake_n_203, B1 => snake_x_loc(8), ZN => image_snake_n_237);
  image_snake_g4972 : NR2D1BWP7T port map(A1 => image_snake_n_208, A2 => image_snake_n_196, ZN => image_snake_n_236);
  image_snake_g4973 : ND2D1BWP7T port map(A1 => image_snake_n_208, A2 => image_snake_n_196, ZN => image_snake_n_235);
  image_snake_g4974 : AOI21D0BWP7T port map(A1 => v_count(8), A2 => image_snake_n_51, B => v_count(9), ZN => image_snake_n_233);
  image_snake_g4975 : AO21D0BWP7T port map(A1 => h_count(7), A2 => image_snake_n_182, B => h_count(8), Z => image_snake_n_232);
  image_snake_g4976 : NR2D1BWP7T port map(A1 => image_snake_n_210, A2 => image_snake_n_189, ZN => image_snake_n_231);
  image_snake_g4977 : ND2D1BWP7T port map(A1 => image_snake_n_225, A2 => image_snake_n_199, ZN => image_snake_n_230);
  image_snake_g4978 : ND2D1BWP7T port map(A1 => image_snake_n_213, A2 => image_snake_n_192, ZN => image_snake_n_229);
  image_snake_g4979 : NR2D1BWP7T port map(A1 => image_snake_n_220, A2 => image_snake_n_193, ZN => image_snake_n_228);
  image_snake_g4980 : MAOI222D1BWP7T port map(A => h_count(2), B => h_count(1), C => image_snake_n_184, ZN => image_snake_n_227);
  image_snake_g4981 : AOI22D0BWP7T port map(A1 => image_snake_n_198, A2 => h_count(0), B1 => h_count(1), B2 => snake_x_loc(5), ZN => image_snake_n_226);
  image_snake_g4982 : AO211D0BWP7T port map(A1 => v_count(2), A2 => snake_y_loc(5), B => v_count(1), C => v_count(0), Z => image_snake_n_218);
  image_snake_g4983 : MAOI22D0BWP7T port map(A1 => image_snake_n_180, A2 => snake_y_loc(0), B1 => v_count(3), B2 => image_snake_n_46, ZN => image_snake_n_217);
  image_snake_g4984 : OAI21D0BWP7T port map(A1 => h_count(4), A2 => image_snake_n_176, B => image_snake_n_187, ZN => image_snake_n_216);
  image_snake_g4985 : OAI21D0BWP7T port map(A1 => h_count(6), A2 => image_snake_n_176, B => image_snake_n_192, ZN => image_snake_n_225);
  image_snake_g4986 : OAI21D0BWP7T port map(A1 => v_count(4), A2 => image_snake_n_183, B => image_snake_n_186, ZN => image_snake_n_224);
  image_snake_g4987 : AOI21D0BWP7T port map(A1 => image_snake_n_130, A2 => snake_y_loc(3), B => image_snake_n_189, ZN => image_snake_n_220);
  image_snake_g4988 : OAI21D0BWP7T port map(A1 => snake_x_loc(6), A2 => image_snake_n_0, B => snake_x_loc(5), ZN => image_snake_n_215);
  image_snake_g4989 : OAI21D0BWP7T port map(A1 => v_count(5), A2 => image_snake_n_167, B => image_snake_n_191, ZN => image_snake_n_214);
  image_snake_g4990 : OAI21D0BWP7T port map(A1 => snake_y_loc(8), A2 => snake_y_loc(6), B => image_snake_n_196, ZN => image_snake_n_219);
  image_snake_g4991 : MAOI22D0BWP7T port map(A1 => h_count(7), A2 => snake_x_loc(4), B1 => h_count(7), B2 => snake_x_loc(4), ZN => image_snake_n_213);
  image_snake_g4992 : MAOI22D0BWP7T port map(A1 => h_count(3), A2 => snake_x_loc(2), B1 => h_count(3), B2 => snake_x_loc(2), ZN => image_snake_n_212);
  image_snake_g4993 : MOAI22D0BWP7T port map(A1 => snake_x_loc(6), A2 => snake_x_loc(5), B1 => snake_x_loc(6), B2 => snake_x_loc(5), ZN => image_snake_n_211);
  image_snake_g4994 : MOAI22D0BWP7T port map(A1 => v_count(8), A2 => snake_y_loc(4), B1 => v_count(8), B2 => snake_y_loc(4), ZN => image_snake_n_210);
  image_snake_g4995 : MAOI22D0BWP7T port map(A1 => v_count(6), A2 => snake_y_loc(4), B1 => v_count(6), B2 => snake_y_loc(4), ZN => image_snake_n_206);
  image_snake_g4996 : MAOI22D0BWP7T port map(A1 => image_snake_n_2, A2 => snake_y_loc(6), B1 => image_snake_n_2, B2 => snake_y_loc(6), ZN => image_snake_n_209);
  image_snake_g4997 : MAOI22D0BWP7T port map(A1 => image_snake_n_181, A2 => snake_y_loc(9), B1 => image_snake_n_181, B2 => snake_y_loc(9), ZN => image_snake_n_208);
  image_snake_g4998 : MAOI22D0BWP7T port map(A1 => image_snake_n_0, A2 => snake_x_loc(9), B1 => snake_x_loc(9), B2 => image_snake_n_0, ZN => image_snake_n_205);
  image_snake_g4999 : MAOI22D0BWP7T port map(A1 => h_count(5), A2 => snake_x_loc(4), B1 => h_count(5), B2 => snake_x_loc(4), ZN => image_snake_n_207);
  image_snake_g5000 : MAOI22D0BWP7T port map(A1 => image_snake_n_22, A2 => snake_x_loc(8), B1 => image_snake_n_22, B2 => snake_x_loc(8), ZN => image_snake_n_204);
  image_snake_g5001 : INVD0BWP7T port map(I => image_snake_n_201, ZN => image_snake_n_202);
  image_snake_g5002 : INVD0BWP7T port map(I => image_snake_n_197, ZN => image_snake_n_198);
  image_snake_g5003 : ND2D0BWP7T port map(A1 => snake_x_loc(9), A2 => snake_x_loc(7), ZN => image_snake_n_203);
  image_snake_g5004 : NR2D0BWP7T port map(A1 => snake_y_loc(7), A2 => snake_y_loc(5), ZN => image_snake_n_201);
  image_snake_g5005 : ND2D1BWP7T port map(A1 => image_snake_n_22, A2 => snake_x_loc(5), ZN => image_snake_n_200);
  image_snake_g5006 : ND2D1BWP7T port map(A1 => h_count(5), A2 => image_snake_n_182, ZN => image_snake_n_199);
  image_snake_g5007 : NR2XD0BWP7T port map(A1 => h_count(1), A2 => snake_x_loc(5), ZN => image_snake_n_197);
  image_snake_g5008 : ND2D0BWP7T port map(A1 => snake_x_loc(6), A2 => snake_x_loc(8), ZN => image_snake_n_195);
  image_snake_g5009 : ND2D1BWP7T port map(A1 => snake_y_loc(8), A2 => snake_y_loc(6), ZN => image_snake_n_196);
  image_snake_g5010 : ND2D1BWP7T port map(A1 => h_count(3), A2 => image_snake_n_15, ZN => image_snake_n_194);
  image_snake_g5011 : AN2D1BWP7T port map(A1 => v_count(6), A2 => image_snake_n_51, Z => image_snake_n_193);
  image_snake_g5012 : NR2D0BWP7T port map(A1 => h_count(2), A2 => image_snake_n_184, ZN => image_snake_n_185);
  image_snake_g5013 : ND2D1BWP7T port map(A1 => h_count(6), A2 => image_snake_n_176, ZN => image_snake_n_192);
  image_snake_g5014 : ND2D1BWP7T port map(A1 => v_count(5), A2 => image_snake_n_167, ZN => image_snake_n_191);
  image_snake_g5015 : ND2D0BWP7T port map(A1 => snake_y_loc(7), A2 => snake_y_loc(9), ZN => image_snake_n_190);
  image_snake_g5016 : NR2D1BWP7T port map(A1 => image_snake_n_130, A2 => snake_y_loc(3), ZN => image_snake_n_189);
  image_snake_g5017 : ND2D1BWP7T port map(A1 => snake_y_loc(5), A2 => snake_y_loc(6), ZN => image_snake_n_188);
  image_snake_g5018 : ND2D1BWP7T port map(A1 => h_count(4), A2 => image_snake_n_176, ZN => image_snake_n_187);
  image_snake_g5019 : ND2D1BWP7T port map(A1 => v_count(4), A2 => image_snake_n_183, ZN => image_snake_n_186);
  image_snake_g5020 : INVD0BWP7T port map(I => snake_x_loc(1), ZN => image_snake_n_184);
  image_snake_g5021 : INVD0BWP7T port map(I => snake_y_loc(2), ZN => image_snake_n_183);
  image_snake_g5022 : INVD0BWP7T port map(I => snake_x_loc(4), ZN => image_snake_n_182);
  image_snake_g5023 : INVD0BWP7T port map(I => snake_y_loc(7), ZN => image_snake_n_181);
  image_snake_g5024 : INVD0BWP7T port map(I => v_count(2), ZN => image_snake_n_180);
  image_snake_g5025 : INVD1BWP7T port map(I => snake_x_loc(3), ZN => image_snake_n_176);
  image_snake_g5026 : INVD1BWP7T port map(I => snake_y_loc(3), ZN => image_snake_n_167);
  image_snake_g5027 : CKND1BWP7T port map(I => v_count(7), ZN => image_snake_n_130);
  image_snake_g5028 : INVD0BWP7T port map(I => snake_y_loc(4), ZN => image_snake_n_51);
  image_snake_g5029 : INVD0BWP7T port map(I => snake_y_loc(1), ZN => image_snake_n_46);
  image_snake_g5030 : INVD1BWP7T port map(I => snake_x_loc(6), ZN => image_snake_n_22);
  image_snake_g5031 : INVD1BWP7T port map(I => snake_x_loc(2), ZN => image_snake_n_15);
  image_snake_g5032 : INVD0BWP7T port map(I => snake_y_loc(5), ZN => image_snake_n_2);
  image_snake_g5033 : INVD1BWP7T port map(I => snake_x_loc(7), ZN => image_snake_n_0);
  image_snake_state_reg_0 : DFD1BWP7T port map(CP => clk, D => image_snake_n_337, Q => image_snake_state(0), QN => image_snake_n_338);

end synthesised;
