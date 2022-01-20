library IEEE;
use IEEE.Std_Logic_1164.all;
entity somador is
port (SW: in std_logic_vector(17 downto 0);
    LEDR: out std_logic_vector(17 downto 0)
  );
end somador;
architecture a of somador is
  signal A1, A0, B0, B1, S0, S1, S2, A, B, C, D, E: std_logic;
         
begin 
  A1 <= SW(0);
  A0 <= SW(1);
  B1 <= SW(2);
  B0 <= SW(3);
  LEDR(0) <= s0;
  LEDR(1) <= s1; 
  LEDR(2) <= s2;
  
  a <= a0 xor b0;
  b <= a0 and b0;
  c <= a1 xor b1;
  d <= b and c;
  e <= b1 and a1;
  s0 <= a;
  s1 <= b xor c;
  s2 <= d or e;
end a;
