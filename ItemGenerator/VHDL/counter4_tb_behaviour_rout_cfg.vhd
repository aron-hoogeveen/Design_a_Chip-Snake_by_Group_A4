configuration counter4_tb_behaviour_rout_cfg of counter4_tb is
   for behaviour
      for all: counter4 use configuration work.counter4_routed_cfg;
      end for;
   end for;
end counter4_tb_behaviour_rout_cfg;
