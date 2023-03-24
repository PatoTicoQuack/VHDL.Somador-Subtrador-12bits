library ieee;
use ieee.std_logic_1164.all;

entity Overflow is 
    port(
                x : in std_logic;
                y : in std_logic;
                z : in std_logic;
        Overfloow : out std_logic);
end entity;

architecture comutar of Overflow is

begin
    -- atrib condicional
    Overfloow <= (NOT(x) and NOT(y) and z) or (x and y and NOT(z)) after 192 ns;

end architecture;
