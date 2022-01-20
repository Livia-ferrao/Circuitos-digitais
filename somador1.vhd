library IEEE;
use IEEE.Std_Logic_1164.all;
entity somador1 is
port (A,B: in std_logic_vector(3 downto 0);
    S: out std_logic_vector(4 downto 0) );
end somador1;

architecture rtl of somador1 is
  signal C: std_logic_vector(2 downto 0);
    
    component halfAdder1 is 
    port( A,B: in std_logic;
        S, Cout: out std_logic);
    end component;
    
    component fullAdder1 is 
    port( A,B, Cin: in std_logic;
        S, Cout: out std_logic);
    end component;
         
begin 
    HA: halfAdder1 port map ( A=> A(0),
                             B => B(0),
                             S => S(0),
                             Cout => C(0));
                             
    FA1: fullAdder1 port map ( A=> A(1),
                             B => B(1),
                             Cin => C(0),
                             S => S(1),
                             Cout => C(1));
                             
    FA2: fullAdder1 port map ( A=> A(2),
                             B => B(2),
                             Cin => C(1),
                             S => S(2),
                             Cout => C(2));
                            
    FA3: fullAdder1 port map ( A=> A(3),
                             B => B(3),
                             Cin => C(2),
                             S => S(3),
                             Cout => S(4));
  
  
end rtl;
