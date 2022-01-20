library IEEE;
use IEEE.Std_Logic_1164.all;

entity exercicio is
port (X: in std_logic_vector(7 downto 0);
      HEX0, HEX1,HEX2: out std_logic_vector(6 downto 0)
      );
end exercicio;

architecture a of exercicio is
    signal dois_x, quarto_x, soma1: std_logic_vector(7 downto 0);
    signal res: std_logic_vector(11 downto 0);
 

    component soma8 is
        port (A:  in std_logic_vector(7 downto 0);
              B:  in std_logic_vector(7 downto 0);
              S:  out std_logic_vector(7 downto 0));
    end component;
    
    component div4 is
        port (A:  in std_logic_vector(7 downto 0);
              S:  out std_logic_vector(7 downto 0));
    end component;

    component binbcd is
        port (bin_in: in std_logic_vector (7 downto 0);
              bcd_out: out std_logic_vector (11 downto 0));
    end component;

    component bcd7seg is
        port(bcd_in:  in std_logic_vector(3 downto 0);
             out_7seg:  out std_logic_vector(6 downto 0));
    end component;

begin
    MULT: soma8 port map(A => X(7 downto 0),
                          B => X(7 downto 0),
                          S => dois_x(7 downto 0)
                          );
                          

    DIV: div4 port map(A => X(7 downto 0),
                         S => quarto_x(7 downto 0)
                         );
    
    
    SOMA: soma8 port map(A => dois_x(7 downto 0),
                         B => quarto_x(7 downto 0),
                         S => soma1(7 downto 0)
                         );
                         

    BIN_BCD: binbcd port map(bin_in => soma1(7 downto 0),
                            bcd_out => res(11 downto 0)
                            );
                            

    BCDto7_0: bcd7seg port map(bcd_in => res(3 downto 0),
                               out_7seg => HEX0(6 downto 0)
                               );
                               

    BCDto7_1: bcd7seg port map(bcd_in => res(7 downto 4),
                               out_7seg => HEX1(6 downto 0)
                               );
                               

    BCDto7_2: bcd7seg port map(bcd_in => res(11 downto 8),
                               out_7seg => HEX2(6 downto 0)
                               );
                               
 


end a;