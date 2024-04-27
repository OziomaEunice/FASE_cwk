package Heating_System with SPARK_Mode is

   -- Define the Temperature and Window Status types
   type Temperature is range 0..40;
   type Windows is (W_Open, W_Closed);
   
   type Heating_Sys is record
      T : Temperature;
      W : Windows;
   end record;
   
   
   procedure Control_Temperature (Temp: in out Temperature) with
     Pre => Temp = 15,
     Post => (Temp >= 17 and Temp <= 19);
   
   procedure Windows_Status (Window: in out Windows) with
     Pre => Window = W_Open,
     Post => Window = W_Closed;

end Heating_System;
