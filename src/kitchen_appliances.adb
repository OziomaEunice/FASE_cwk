package body Kitchen_Appliances with SPARK_Mode is

   procedure Fridge_Status (S: out Not_Open) is
   begin
      -- when oven is open, the fridge must be closed
      S.F := F_Closed;
      S.O := O_Open;      
   end Fridge_Status;
   
  
   procedure Oven_Status (S: out Not_Open) is
   begin
      -- when fridge is open, the oven must be closed
      S.O := O_Closed;
      S.F := F_Open;      
   end Oven_Status;
   

end kitchen_appliances;
