with Heating_System; use Heating_System;
with Kitchen_Appliances; use Kitchen_Appliances;

package Home with SPARK_Mode is

   type HomeSettingForEnergy is record
      TemperatureSetting : Temperature;
      WindowsStatus : Windows;
      FridgeStatus : Not_Open;    
      OvenStatus : Not_Open;
   end record;
   
   type Carbon_Monoxide is (Safe, Unsafe);

   
   procedure House_Temperature (ht,ch: in out HomeSettingForEnergy) 
     with
     Pre => ch.WindowsStatus = W_Closed or ch.WindowsStatus = W_Open,
     Post => (ht.TemperatureSetting >= 17 and ht.TemperatureSetting <= 19)
              and ch.WindowsStatus = W_Closed;
  
   
   procedure KitchenAppliancesStatus (fr,ov: out Not_Open) with
     Post => (fr.F = F_Open) and (ov.O = O_Open);
   
   
   procedure CheckLevelOfCarbonMonoxide (cm: in out Carbon_Monoxide) with
     Pre => cm = Unsafe or cm = Safe,
     Post => (cm = Safe or cm = Unsafe);
   
   
end Home;
