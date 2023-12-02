with Ada.Text_IO; use Ada.Text_IO;

procedure Main is
   
   file : File_Type;
   
   frst : Integer;
   scnd : Integer;
   res : Integer := 0;
   flag : boolean := false;

begin
   
   open(file, In_File, name => "prob1.txt");

   while not End_Of_File(file) loop
      declare
         line : string := Get_Line(file);
      begin
         for i of line loop
            if Character'Pos (i) <= 57 and then Character'Pos (i) >= 48 then
               if not flag then
                  frst := Integer'Value ((1 => i));
                  scnd := Integer'Value ((1 => i));
                  flag := True;
               else
                  scnd := Integer'Value ((1 => i));
               end if;
            end if;
         end loop;
         flag := False;
         --  Put_Line ("First = " & frst'Image & " | Second = " & scnd'Image);
         res := res + (frst * 10) + scnd;
      end;
      
   end loop;

   close(file);

   Put_Line ("rest = " & res'Image);

   

   
end Main;
