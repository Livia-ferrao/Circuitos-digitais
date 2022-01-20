library IEEE;
use IEEE.Std_Logic_1164.all;

entity fullAdder1 is
port (A,B,Cin: in std_logic;
      S,Cout: out std_logic
  );
end fullAdder1;

architecture fa1 of fullAdder1 is
begin 
  S <= (A xor B) xor (Cin);
  Cout <= ((A xor B) and Cin) or (A and B);
end fa1;
