library ieee;
use ieee.std_logic_1164.all;

entity MuxSeletor is 
    port(
             Soma : in std_logic_vector (11 downto 0);
           SSubtr : in std_logic_vector (11 downto 0);
              Sel : in std_logic;
             muxS : out std_logic_vector (11 downto 0)
        );
end entity;

architecture comutar of MuxSeletor is

begin
    -- atrib condicional
    muxS <= Soma when Sel = '0' else SSubtr when Sel = '1';

end architecture;
