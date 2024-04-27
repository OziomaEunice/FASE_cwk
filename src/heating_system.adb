package body Heating_System with SPARK_Mode is

   -- Implementation for the temperature control function
   procedure Control_Temperature(Temp: in out Temperature) is
   begin  
      -- Initialize Temperature to be at 15°C
      Temp := 15;
      
      -- Control temperature and window status
      -- (temperature must be between 17°C and 19°C)
      case Temp is
         
         -- Check if temperature is low. 
         -- if it is then turn on the heating system.
         when 0 .. 16 =>
            if (Temp < 17 or Temp > 19) then
               Temp := 18;
            end if;            
            
            -- If temperature is high, 
            -- then turn off the heating system.
         when 20..40 =>
               if (Temp >= 20) then
                  Temp := 19;
            end if;
            
            -- If temperature is between 17°C and 19°C, 
            -- leave the temperature as it is.
         when 17..19 =>
               null;
      end case;
      
   end Control_Temperature;
   
   
   -- Implementation for the Windows control function
   procedure Windows_Status (Window: out Windows) is
   begin
      Window := W_Open;
   end Windows_Status;
   

end Heating_System;
