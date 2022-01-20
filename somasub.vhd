library IEEE;
use IEEE.Std_Logic_1164.all;

entity somasub is
port (A,B: in std_logic_vector(3 downto 0);
      C: in std_logic_vector(1 downto 0);
      S: out std_logic_vector(3 downto 0);
      overflow: out std_logic);
end somasub;

architecture circuito of somasub is
    signal SB, Cout: std_logic_vector(3 downto 0);
    
    component modb is
        port (C0, C1: in std_logic;
              B: in std_logic;
              S: out std_logic);
    end component;

    component fullAdder1 is
        port (A, B, Cin: in std_logic;
              S,  Cout: out std_logic);
    end component;
    
begin
    
    MB1: modb port map( B => B(0),
                        C0 => C(0),
                        C1 => C(1),
                        S => SB(0));
    
    FA1: fulladder1 port map (A => A(0),
                            B => SB(0), 
                            Cin => C(0),
                            S => S(0),
                            Cout => Cout(0));

    MB2: modb port map( B => B(1),
                        C0 => C(0),
                        C1 => C(1),
                        S => SB(1));

    FA2: fulladder1 port map (A => A(1),
                            B => SB(1), 
                            Cin => Cout(0),
                            S => S(1),
                            Cout => Cout(1));
    
    MB3: modb port map( B => B(2),
                        C0 => C(0),
                        C1 => C(1),
                        S => SB(2));

    FA3: fulladder1 port map (A => A(2),
                            B => SB(2), 
                            Cin => Cout(1),
                            S => S(2),
                            Cout => Cout(2));
    
    MB4: modb port map( B => B(3),
                        C0 => C(0),
                        C1 => C(1),
                        S => SB(3));

    FA4: fulladder1 port map (A => A(3),
                            B => SB(3), 
                            Cin => Cout(2),
                            S => S(3),
                            Cout => Cout(3));
  
  
    overflow <= (Cout(2) XOR Cout(3));

end circuito;



