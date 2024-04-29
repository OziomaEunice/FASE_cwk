package Heating_System with SPARK_Mode is

   -- Define the Temperature and Window Status types
   type Temperature is range 0..40;
   type Windows is (W_Open, W_Closed);
   
   
   procedure Control_Temperature (Temp: in out Temperature) with
     Pre => Temp <= 40,
     Post => (Temp >= 17 and Temp <= 19);
   
   procedure Windows_Status (Window: in out Windows) with
     Pre => (Window = W_Open or Window = W_Closed),
     Post => Window = W_Closed;

end Heating_System;
