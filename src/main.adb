with Heating_System; use Heating_System;
--  with Ventilation_System; use Ventilation_System;

with Ada.Text_IO; use Ada.Text_IO;


procedure main is
begin

   -- set the Temperature at 21
   Temperature := 21;

   -- set windows status to be open
   Windows_Open := True;

   -- print output in the console
   Put_Line("Temperature of the house is set at: ");
   Put_Line(Temperature'Image);
   Put_Line("Windows are currently: ");
   Put_Line(Windows_Open'Image);

   Control_Heating;

   Put_Line("Update");
   Put_Line("Temperature of the house is set at: ");
   Put_Line(Temperature'Image);
   Put_Line("Windows are currently: ");
   Put_Line(Windows_Open'Image);

end main;
