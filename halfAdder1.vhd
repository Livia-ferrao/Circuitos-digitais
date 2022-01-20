library IEEE;
use IEEE.Std_Logic_1164.all;

entity halfAdder1 is
port (A,B: in std_logic;
      S,Cout: out std_logic
  );
end halfAdder1;

architecture ha1 of halfAdder1 is
begin 
  S <= A xor B;
  Cout <= A xor B;
end ha1;
