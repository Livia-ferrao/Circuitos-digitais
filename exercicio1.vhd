library IEEE;
use IEEE.Std_Logic_1164.all;

entity exercicio1 is
    port (X: in std_logic_vector(7 downto 0);
          HEX0, HEX1, HEX2: out std_logic_vector(6 downto 0);
          chave: in std_logic);
end exercicio1;

architecture a of exercicio1 is
    signal dois_x, x_quarto, l, b: std_logic_vector(11 downto 0);
    signal bcd_libras, bcd_kg: std_logic_vector(11 downto 0);
    signal l0, l1, l2, kg0, kg1, kg2: std_logic_vector(6 downto 0);

    component soma8 is
        port(A: in std_logic_vector(7 downto 0);
             B: in std_logic_vector(7 downto 0);
             S: out std_logic_vector(7 downto 0));
    end component;

    component div4 is
        port(A:  in std_logic_vector(7 downto 0);
             S:  out std_logic_vector(7 downto 0));
    end component;
    
    component binbcd is
        port(bin_in: in std_logic_vector (7 downto 0);
             bcd_out: out std_logic_vector (11 downto 0));
    end component;

    component bcd7seg is
        port(bcd_in:  in std_logic_vector(3 downto 0);
             out_7seg:  out std_logic_vector(6 downto 0));
    end component;
    
begin
    m2: soma8 port map(A => X(7 downto 0),
                                   B => X(7 downto 0),
                                   S => dois_x(7 downto 0));
    
    d4: div4 port map(A => X(7 downto 0),
                               S => x_quarto(7 downto 0));
    
    soma1: soma8 port map(A => dois_x(7 downto 0),
                              B => x_quarto(7 downto 0),
                              S => l(7 downto 0));
    

    convertBCD: binbcd port map(bin_in => l(7 downto 0),
                                    bcd_out => bcd_libras(11 downto 0));
                                    
    convert2: bcd7seg port map(bcd_in => bcd_libras(3 downto 0),
                                out_7seg => l0(6 downto 0));
                                
    convert3: bcd7seg port map(bcd_in => bcd_libras(7 downto 4),
                               out_7seg => l1(6 downto 0));

    convert4: bcd7seg port map(bcd_in => bcd_libras(11 downto 8),
                                   out_7seg => l2(6 downto 0));


    convertBIN: binbcd port map(bin_in => X(7 downto 0),
                                    bcd_out => bcd_kg(11 downto 0));
                                    
    convert6: bcd7seg port map(bcd_in => bcd_kg(3 downto 0),
                                out_7seg => kg0(6 downto 0));
                                
    convert7: bcd7seg port map(bcd_in => bcd_kg(7 downto 4),
                               out_7seg => kg1(6 downto 0));

    convert8: bcd7seg port map(bcd_in => bcd_kg(11 downto 8),
                                   out_7seg => kg2(6 downto 0));

    HEX0 <= l0 when chave = '1' else kg0;
    HEX1 <= l1 when chave = '1' else kg1;
    HEX2 <= l2 when chave = '1' else kg2;

end a;
