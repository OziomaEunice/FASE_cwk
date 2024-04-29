with Heating_System; use Heating_System;
with Kitchen_Appliances; use Kitchen_Appliances;

package body Home with SPARK_Mode is

   procedure House_Temperature (ht: in out HomeSettingForEnergy) is
   begin
      ht.TemperatureSetting := 15; -- also try ht.TemperatureSetting := 17
                                   -- also try ht.TemperatureSetting := 23
      
      Control_Temperature(ht.TemperatureSetting);
      
   end House_Temperature;
   
   
   procedure Control_Windows (ch: in out HomeSettingForEnergy) is
   begin
      -- initialise window status
      -- ch.WindowsStatus := W_Open;
      
      Windows_Status(ch.WindowsStatus);
      
   end Control_Windows;
   
   
   procedure IsFridgeOpenOrClosed (fr: out Not_Open) is
   begin 
      --  fr.F := F_Open;
      --  fr.O := O_Closed;
      
      Oven_Status(fr); -- from the oven procedure: fridge is open,
                       -- while oven is closed
      
   end IsFridgeOpenOrClosed;
   
   
   procedure IsOvenOpenOrClosed (ov: out Not_Open) is
   begin
      --  ov.O := O_Closed;
      --  ov.F := F_Open;
      
      Fridge_Status(ov); -- from the fridge procedure: oven is open,
                         -- while fridge is closed
      
   end IsOvenOpenOrClosed;
    
   
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
      House_Temperature(Temperature_Result);
      Control_Windows(Windows_Result);
      IsFridgeOpenOrClosed(Fridge_Result);
      IsOvenOpenOrClosed(Oven_Result);
      
      
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
