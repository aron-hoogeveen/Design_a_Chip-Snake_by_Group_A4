configuration counter4_tb_behaviour_cfg of counter4_tb is
   for behaviour
      for all: counter4 use configuration work.counter4_behaviour_cfg;
      end for;
   end for;
end counter4_tb_behaviour_cfg;
