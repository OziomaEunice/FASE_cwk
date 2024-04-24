package Heating_System with SPARK_Mode is

   -- Define the Temperature type
   type Temperature is range 0..40;
   
   -- Function for the heating control system
   procedure Control_Heating(Temp: in out Temperature; Windows_Open: out Boolean)
     with
       Pre => Temp = 15,
       Post => (Temp >= 17 and Temp <= 19);

end Heating_System;
