with Ada.Text_IO;	use Ada.Text_IO;
with GNAT.Sockets;	use GNAT.Sockets;
with Ada.Streams;
use type Ada.Streams.Stream_Element_Count;

procedure UDPtest is
   Client : Socket_Type;
   Address: Sock_Addr_Type;
   Channel: Stream_Access;
begin
   GNAT.Sockets.Initialize;
   Create_Socket(Client,Family_Inet,Socket_Datagram);
   Address.Addr:=Inet_Addr("127.0.0.1");
   Address.Port:=60061;
   Bind_Socket(Client,Address);
   Address.Port:=60060;
   --Connect_Socket(Client,Address);
   Channel:=Stream(Client,Address);

   String'Write(Channel, "I'm hungry.");	--HTTP_Send
   Free(Channel);
   Close_Socket(Client);
   Finalize;
end UDPtest;
