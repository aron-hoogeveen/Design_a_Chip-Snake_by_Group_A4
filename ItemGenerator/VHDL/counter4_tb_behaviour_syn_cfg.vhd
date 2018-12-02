configuration counter4_tb_behaviour_syn_cfg of counter4_tb is
   for behaviour
      for all: counter4 use configuration work.counter4_synthesised_cfg;
      end for;
   end for;
end counter4_tb_behaviour_syn_cfg;
