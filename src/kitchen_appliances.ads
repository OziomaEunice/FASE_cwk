package Kitchen_Appliances with SPARK_Mode is

   type Fridge is (F_Open, F_Closed);
   type Oven is (O_Open, O_Closed);

   type Not_Open is record
      F: Fridge;
      O: Oven;
   end record;


   procedure Fridge_Status (S: out Not_Open) with
     Post => S.F = F_Closed and S.O = O_Open;

   procedure Oven_Status (S: out Not_Open) with
     Post => S.O = O_Closed and S.F = F_Open;

end kitchen_appliances;
