library ieee;
use ieee.std_logic_1164.all;
entity testbenchFullAdder is
end testbenchFullAdder;
architecture tb of testbenchFullAdder is
    signal A, B, Sum, Cout, Cin : std_logic;
    component fullAdder1 is port 
    (A,B,Cin: in std_logic;
      S,Cout: out std_logic);
    end component;
begin
    DUT : fullAdder1 port map (A => A, 
                              B => B,
                              Cin => Cin,
                              S => Sum,
                              Cout => Cout);
   process
        constant period: time := 10 ns;
        begin
            A <= '0'; B <= '0'; Cin <= '0'; 
            wait for period;
            A <= '0'; B <= '0'; Cin <= '1';
            wait for period;
            A <= '0'; B <= '1'; Cin <= '0';
            wait for period;
            A <= '0'; B <= '1'; Cin <= 