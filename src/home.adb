with Heating_System; use Heating_System;
with Kitchen_Appliances; use Kitchen_Appliances;

package body Home with SPARK_Mode is

   procedure House_Temperature (ht: in out HomeSettingForEnergy) is
   begin
      ht.TemperatureSetting := 15;
      
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
    
   
   -- make the CarbonMonoxide a FUNCTION instead of PROCEDURE !!!
   procedure CarbonMonoxide (cm: out Carbon_Monoxide) is
   begin
      cm := Safe;
   end CarbonMonoxide;
   

end Home;
