configuration itemgenerator_behaviour_par of itemgenerator is
   for behaviour
      for all: counter4 use configuration work.counter4_behaviour_cfg;
      end for;
      for all: shift_register use configuration work.shift_register_behaviour_cfg;
      end for;
      for all: counter_fps use configuration work.counter_fps_behaviour_cfg;
      end for;
      for all: rng use configuration work.rng_routed_cfg;
      end for;
   end for;
end itemgenerator_behaviour_par;
