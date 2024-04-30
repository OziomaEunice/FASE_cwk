with Heating_System; use Heating_System;
with Kitchen_Appliances; use Kitchen_Appliances;

package body Home with SPARK_Mode is

   procedure House_Temperature (ht,ch: in out HomeSettingForEnergy) is
   begin
      ht.TemperatureSetting := 15; -- also try ht.TemperatureSetting := 17
                                   -- also try ht.TemperatureSetting := 23
      
      Control_Temperature(ht.TemperatureSetting);
      Windows_Status(ch.WindowsStatus);
      
   end House_Temperature;
   
   
   procedure KitchenAppliancesStatus (fr,ov: out Not_Open) is
   begin 
      Oven_Status(fr); -- from the oven procedure: fridge is open,
                       -- while oven is closed
      
      Fridge_Status(ov); -- from the fridge procedure: oven is open,
                         -- while fridge is closed
   
   end KitchenAppliancesStatus;
   
   
      
   procedure CheckLevelOfCarbonMonoxide (cm: in out Carbon_Monoxide) is
      -- These variables store the results of all the
      -- above procedures
      Temperature_Result : HomeSettingForEnergy := (TemperatureSetting => 15,
                                                WindowsStatus => W_Closed,
                                                FridgeStatus => (F => F_Open, O => O_Closed),
                                                OvenStatus => (F => F_Open, O => O_Closed));
      Windows_Result : HomeSettingForEnergy := (TemperatureSetting => 15,
                                                WindowsStatus => W_Closed,
                                                FridgeStatus => (F => F_Open, O => O_Closed),
                                                OvenStatus => (F => F_Open, O => O_Closed));
      Fridge_Result : Not_Open;
      Oven_Result : Not_Open;
   begin
      -- call the procedures to get their results
      House_Temperature(Temperature_Result, Windows_Result);
      KitchenAppliancesStatus(Fridge_Result, Oven_Result);
      
      
      -- Evaluate the results and if they are all
      -- in good conditions, return safe, else return unsafe
      if Temperature_Result.TemperatureSetting >= 17 and
         Temperature_Result.TemperatureSetting <= 19 and
         Windows_Result.WindowsStatus = W_Closed and 
         Fridge_Result.F = F_Open and
         Oven_Result.O = O_Closed then
         
         cm := Safe;
         
      else
         cm := Unsafe;
      end if;
      
        
   end CheckLevelOfCarbonMonoxide;
   
   

end Home;
