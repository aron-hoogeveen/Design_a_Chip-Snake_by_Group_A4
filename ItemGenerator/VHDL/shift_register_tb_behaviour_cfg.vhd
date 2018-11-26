configuration shift_register_tb_behaviour_cfg of shift_register_tb is
   for behaviour
      for all: shift_register use configuration work.shift_register_behaviour_cfg;
      end for;
   end for;
end shift_register_tb_behaviour_cfg;
