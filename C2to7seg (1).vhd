library IEEE;
use IEEE.Std_Logic_1164.all;

entity C2to7seg is
port (C2: in std_logic_vector(3 downto 0);
    s7seg: out std_logic_vector(6 downto 0);
    sinal: out std_logic);
end C2to7seg;

architecture decod of C2to7seg is
  signal A,B: std_logic_vector(3 downto 0);
  
    component Compl2 is
    port (X:  in std_logic_vector(3 downto 0);
        Y:  out std_logic_vector(3 downto 0));
    end component;
    
    component multiplexador is
    port (x:  in std_logic_vector(3 downto 0);
        y:  in std_logic_vector(3 downto 0);
        sel: in std_logic;
        z:  out std_logic_vector(3 downto 0) );
    end component;
    
    component decodificador is
    port (C:  in std_logic_vector(3 downto 0);
        F:  out std_logic_vector(6 downto 0) );
    end component;
         
begin 
    compl: Compl2 port map (X => C2,
                             Y => A);
                             
    mux: multiplexador port map ( x=> A,
                             y => C2,
                             sel => C2(3),
                             z => B);
                             
    decod: decodificador port map ( C => B,
                                    F => s7seg);
                
    sinal <= C2(3);
  
  
end decod;
