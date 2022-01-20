library IEEE;
use IEEE.Std_Logic_1164.all;

entity modb is
port (B, C1, C0: in std_logic;
      S: out std_logic);
end modb;

architecture circuito of modb is
    signal O: std_logic_vector(2 downto 0);
    
 begin 
  
  O(0) <= ((NOT C0) AND B);
  O(1) <= (C1 AND (NOT B));
  S <=  O(0) OR O(1);
  
end circuito;
