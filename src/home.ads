with Heating_System; use Heating_System;
with Kitchen_Appliances; use Kitchen_Appliances;

package Home with SPARK_Mode is

   type HomeSettingForEnergy is record
      TemperatureSetting : Temperature;
      WindowsStatus : Windows;
      FridgeStatus : Not_Open;    
      OvenStatus : Not_Open;
   end record;
   
   type Carbon_Monoxide is (True, False);

   
   procedure House_Temperature (ht: in out HomeSettingForEnergy) with
     Post => (ht.TemperatureSetting >= 17 and ht.TemperatureSetting <= 19); 

   procedure Control_Windows (ch: in out HomeSettingForEnergy) with
     Post => (ch.WindowsStatus = W_Closed);
   
   procedure IsFridgeOpenOrClosed (fr: out Not_Open) with
     Post => fr.F = F_Open;
   
   procedure IsOvenOpenOrClosed (ov: out Not_Open) with
     Post => ov.O = O_Closed;
   
   procedure CarbonMonoxide (cm: out Carbon_Monoxide) with
     Post => cm = True;
   
   
end Home;
