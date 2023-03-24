library ieee;
use ieee.std_logic_1164.all;

entity SomaSub1bit is 
    port(
              X : in std_logic;
              Y : in std_logic;
            Cin : in std_logic;
              S : out std_logic;
           Cout : out std_logic
    );
end entity;

architecture comutar of SomaSub1bit is

begin
    -- atrib condicional
    S <= (X and NOT(Y) and NOT(Cin)) or (NOT(X) and NOT(Y) and Cin) or (X and Y and Cin) or (NOT(X) and Y and NOT(Cin)) after 16 ns;
    Cout <= (Y and Cin) or (X and Cin) or (X and Y) after 12 ns;
end architecture;
