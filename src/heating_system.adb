package body Heating_System with SPARK_Mode is

   -- Specification for the heating control function
   procedure Control_Heating(Temp: in out Temperature; Windows_Open: out Boolean)
   is
   begin  
       -- Initialize Windows_Open to False
      Windows_Open := False;
      
      
      -- Control temperature and window status
      -- (temperature must be between 17°C and 19°C)
      case Temp is
         
         -- Check if windows are open or not, and temperature is low. 
         -- if windows are not open then turn on the heating system, 
         -- else if they are open, then close windows and tune on the 
         -- heating system.
         when 0 .. 16 =>
            if not Windows_Open then 
               Temp := 18;
            else 
               if Windows_Open then
                  Windows_Open := False;
                  Temp := 18;
               end if;
            end if;            
            
            -- If windows are open, or temperature is high, 
            -- either close the windows or turn off the heating system.
         when 20..40 =>
               if Windows_Open then
                  Windows_Open := False;
                  --Temp := 19;
               else 
                  Temp := 19;
            end if;
            
            -- If windows are open, or temperature is between 17°C and 19°C, 
            -- close the windows, or leave the temperature as it is.
         when 17..19 =>
            if Windows_Open then 
              Windows_Open := False;
            end if;
      
      end case;
      
   end Control_Heating;

end Heating_System;
