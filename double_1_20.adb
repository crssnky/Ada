with Ada.Text_IO;

procedure double_1_20 is
   package T_IO renames Ada.Text_IO;
   package I_IO is new Ada.Text_IO.Integer_IO(Integer);

   procedure Power(Item : in out Integer)is
   begin
      Item:=Item*2;
   end Power;
X:Integer := 1;
begin
   for i in Integer range 1..30 loop
      I_IO.Put(X);
      T_IO.New_Line;
      Power(X);
   end loop;
end double_1_20;
