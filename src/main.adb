with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

procedure Main is
   
   file : File_Type;
   
   frst : Integer;
   scnd : Integer;
   res : Integer := 0;
   res2 : Integer := 0;
   flag : boolean := false;

   Alpha_Size : constant integer := 26;

   type Trie_Node is null record;

   type Node_list is array (1 .. Alpha_Size) of Trie_Node;

   type Trie_Node is record
      Children : Node_list;
      End_Of_Word : Boolean := False;
   end record;

   function Get_Node return Trie_Node is
      Node : Trie_Node := (Children => [others => null], End_Of_Word => False);
   begin
      return Node;
   end Get_Node;

   procedure Insert_Node (root : in Trie_Node; key : in String) is
      crawl : Trie_Node := root;
      index : integer;
   begin
      for i of String loop
         index := integer'Value ((1 => i)) - integer'Value ("a");
         if not crawl.Children(index) then
            crawl.Children(index) := Get_Node;
         end if;
         crawl := crawl.Children(index);
      end loop;
      crawl.End_Of_Word := True;
   end Insert_Node;

   procedure Find_Lit_Number (line : in String; Val : out integer) is
      S : Unbounded_String := Null_Unbounded_String;
   begin
      for i of line loop
         Append (S, i);
         case To_String(S) is
            when "one" => Val := 1;
            when "two" => Val := 2;
            when "three" => Val := 3;
            when "four" => Val := 4;
            when "five" => Val := 5;
            when "six" => Val := 6;
            when "seven" => Val := 7;
            when "eight" => Val := 8;
            when "nine" => Val := 9;
            when "zero" => Val := 0;
         end case;
      end loop;
   end Find_Lit_Number;

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

   ------ Ex 2 -----

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
            else

            end if;
         end loop;
         flag := False;
         Put_Line ("First = " & frst'Image & " | Second = " & scnd'Image);
         res := res + (frst * 10) + scnd;
      end;
      
   end loop;

   close(file);

   

   
end Main;
