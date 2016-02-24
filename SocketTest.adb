with Ada.Text_IO;	use Ada.Text_IO;
with GNAT.Sockets;	use GNAT.Sockets;
with Ada.Streams;
use type Ada.Streams.Stream_Element_Count;

procedure SocketTest is
   Client : Socket_Type;
   Address: Sock_Addr_Type;
   Channel: Stream_Access;
   Host_Entry:Host_Entry_Type:=Get_Host_By_Name("sonic.sega.jp");
   Send   : String:=ASCII.CR & ASCII.LF;
   Offset : Ada.Streams.Stream_Element_Count;
   Data   : Ada.Streams.Stream_Element_Array(1 .. 256);
begin
   GNAT.Sockets.Initialize;
   Create_Socket(Client);
   Address.Addr:=Addresses(Host_Entry,1);
   Address.Port:=80;

   Connect_Socket(Client,Address);
   Channel:=Stream(Client);

   String'Write(Channel, "GET / HTTP/1.1" & Send & "Host:sonic.sega.jp"&Send&Send);	--HTTP_Send
   loop
   Ada.Streams.Read(Channel.all,Data,Offset);
      exit when  Offset=0;
      for I in 1 .. Offset loop
         Put(Character'Val(Data(I)));
      end loop;
   end loop;
end SocketTest;
