library IEEE;
use IEEE.Std_Logic_1164.all;
entity halfAdder is
port (SW: in std_logic_vector(17 downto 0);
    LEDR: out std_logic_vector(17 downto 0)
  );
end halfAdder;
architecture a of halfAdder is
  signal A, B: std_logic;
         
begin 
  A <= SW(0);
  B <= SW(1);
  LEDR(0) <= A and B;
  LEDR(1) <= A xor B;
end a;
