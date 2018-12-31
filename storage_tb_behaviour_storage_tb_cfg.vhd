configuration storage_tb_behaviour_storage_tb_cfg of storage_tb is
   for behaviour_storage_tb
      for all: storage use configuration work.storage_behaviour_storage_cfg;
      end for;
   end for;
end storage_tb_behaviour_storage_tb_cfg;
