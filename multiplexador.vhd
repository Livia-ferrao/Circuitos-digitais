library IEEE;
use IEEE.Std_Logic_1164.all;

entity multiplexador is
port (x:  in std_logic_vector(3 downto 0);
      y:  in std_logic_vector(3 downto 0);
      sel: in std_logic;
      z:  out std_logic_vector(3 downto 0) );
end multiplexador;

architecture multi of multiplexador is
begin 
    z <= x when sel = '1' else
	     y when sel = '0';

end multi;
