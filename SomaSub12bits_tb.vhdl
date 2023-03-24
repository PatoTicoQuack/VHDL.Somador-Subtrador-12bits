library ieee;
use ieee.std_logic_1164.all;

entity SomaSub12bits_tb is
end entity;
    
architecture teste of SomaSub12bits_tb is

    component SomaSub1bit is --Componente do somador de 1 bit.
        port(
                  X : in std_logic;
                  Y : in std_logic;
                Cin : in std_logic;
                  S : out std_logic;
               Cout : out std_logic);
    end component;

    component MuxSeletor is --Componente do seletor.
        port(
               Soma : in std_logic_vector (11 downto 0);
             SSubtr : in std_logic_vector (11 downto 0);
                Sel : in std_logic;
               muxS : out std_logic_vector (11 downto 0));
    end component;

    component Overflow is --Componente do overflow.
        port(
                x : in std_logic;
                y : in std_logic;
                z : in std_logic;
        Overfloow : out std_logic);
    end component;

    signal           lX : std_logic_vector (11 downto 0);
    signal           lY : std_logic_vector (11 downto 0);
    signal         laux : std_logic_vector (11 downto 0);
    signal         lCin : std_logic;
    signal           lS : std_logic_vector (11 downto 0);
    signal        lCout : std_logic;
    signal    lYinverso : std_logic_vector (11 downto 0);
    signal  lzerozeroUm : std_logic_vector (11 downto 0);
    signal         lSC2 : std_logic_vector (11 downto 0);
    signal       lauxC2 : std_logic_vector (11 downto 0);
    signal    lCinSubtr : std_logic;
    signal       lCinC2 : std_logic;
    signal      lCoutC2 : std_logic;
    signal      lSSubtr : std_logic_vector (11 downto 0);
    signal    lSubtrAux : std_logic_vector (11 downto 0);
    signal   SelSomaSub : std_logic;
    signal   lCoutSaida : std_logic;
    signal     muxSaida : std_logic_vector (11 downto 0);
    signal OverflowReal : std_logic;
    signal     SeletorY : std_logic;
    
begin
 
      MUX0 : MuxSeletor port map (lS, lSSubtr, SelSomaSub, muxSaida); --Atribuição do Seletor.

     SS1b0 : SomaSub1bit port map (lX(0), lY(0), lCin, lS(0), laux(0)); --Atribuições do Somador 1 bit aos 12 signals do somador.
     SS1b1 : SomaSub1bit port map (lX(1), lY(1), laux(0), lS(1), laux(1));
     SS1b2 : SomaSub1bit port map (lX(2), lY(2), laux(1), lS(2), laux(2));
     SS1b3 : SomaSub1bit port map (lX(3), lY(3), laux(2), lS(3), laux(3));
     SS1b4 : SomaSub1bit port map (lX(4), lY(4), laux(3), lS(4), laux(4));
     SS1b5 : SomaSub1bit port map (lX(5), lY(5), laux(4), lS(5), laux(5));
     SS1b6 : SomaSub1bit port map (lX(6), lY(6), laux(5), lS(6), laux(6));
     SS1b7 : SomaSub1bit port map (lX(7), lY(7), laux(6), lS(7), laux(7));
     SS1b8 : SomaSub1bit port map (lX(8), lY(8), laux(7), lS(8), laux(8));
     SS1b9 : SomaSub1bit port map (lX(9), lY(9), laux(8), lS(9), laux(9));
    SS1b10 : SomaSub1bit port map (lX(10), lY(10), laux(9), lS(10), laux(10));
    SS1b11 : SomaSub1bit port map (lX(11), lY(11), laux(10), lS(11), lCout);

    lYinverso <= not(lY); --Inverter o valor de Y.
    lzerozeroUm <= "000000000001"; --Complemento no inversor do Y.
 
     SSC20 : SomaSub1bit port map (lYinverso(0), lzerozeroUm(0), lCinC2, lSC2(0), lauxC2(0)); --Atribuições do Somador 1 bit aos 12 signals do subtrador.
     SSC21 : SomaSub1bit port map (lYinverso(1), lzerozeroUm(1), lauxC2(0), lSC2(1), lauxC2(1));
     SSC22 : SomaSub1bit port map (lYinverso(2), lzerozeroUm(2), lauxC2(1), lSC2(2), lauxC2(2));
     SSC23 : SomaSub1bit port map (lYinverso(3), lzerozeroUm(3), lauxC2(2), lSC2(3), lauxC2(3));
     SSC24 : SomaSub1bit port map (lYinverso(4), lzerozeroUm(4), lauxC2(3), lSC2(4), lauxC2(4));
     SSC25 : SomaSub1bit port map (lYinverso(5), lzerozeroUm(5), lauxC2(4), lSC2(5), lauxC2(5));
     SSC26 : SomaSub1bit port map (lYinverso(6), lzerozeroUm(6), lauxC2(5), lSC2(6), lauxC2(6));
     SSC27 : SomaSub1bit port map (lYinverso(7), lzerozeroUm(7), lauxC2(6), lSC2(7), lauxC2(7));
     SSC28 : SomaSub1bit port map (lYinverso(8), lzerozeroUm(8), lauxC2(7), lSC2(8), lauxC2(8));
     SSC29 : SomaSub1bit port map (lYinverso(9), lzerozeroUm(9), lauxC2(8), lSC2(9), lauxC2(9));
    SSC210 : SomaSub1bit port map (lYinverso(10), lzerozeroUm(10), lauxC2(9), lSC2(10), lauxC2(10));
    SSC211 : SomaSub1bit port map (lYinverso(11), lzerozeroUm(11), lauxC2(10), lSC2(11), lCoutC2);

   SSubtr0 : SomaSub1bit port map (lX(0), lSC2(0), lCinSubtr, lSSubtr(0), lSubtrAux(0)); --Junção do somador ao subtrador com o seletor pra escolher um dos dois para a saída.
   SSubtr1 : SomaSub1bit port map (lX(1), lSC2(1), lSubtrAux(0), lSSubtr(1), lSubtrAux(1));
   SSubtr2 : SomaSub1bit port map (lX(2), lSC2(2), lSubtrAux(1), lSSubtr(2), lSubtrAux(2));
   SSubtr3 : SomaSub1bit port map (lX(3), lSC2(3), lSubtrAux(2), lSSubtr(3), lSubtrAux(3));
   SSubtr4 : SomaSub1bit port map (lX(4), lSC2(4), lSubtrAux(3), lSSubtr(4), lSubtrAux(4));
   SSubtr5 : SomaSub1bit port map (lX(5), lSC2(5), lSubtrAux(4), lSSubtr(5), lSubtrAux(5));
   SSubtr6 : SomaSub1bit port map (lX(6), lSC2(6), lSubtrAux(5), lSSubtr(6), lSubtrAux(6));
   SSubtr7 : SomaSub1bit port map (lX(7), lSC2(7), lSubtrAux(6), lSSubtr(7), lSubtrAux(7));
   SSubtr8 : SomaSub1bit port map (lX(8), lSC2(8), lSubtrAux(7), lSSubtr(8), lSubtrAux(8));
   SSubtr9 : SomaSub1bit port map (lX(9), lSC2(9), lSubtrAux(8), lSSubtr(9), lSubtrAux(9));
  SSubtr10 : SomaSub1bit port map (lX(10), lSC2(10), lSubtrAux(9), lSSubtr(10), lSubtrAux(10));
  SSubtr11 : SomaSub1bit port map (lX(11), lSC2(11), lSubtrAux(10), lSSubtr(11), lCoutSaida);

    SeletorY <= lY(11) when SelSomaSub = '0' else lSC2(11) when SelSomaSub = '1'; --Seletor do bit mais significativo do Y quando for soma ou subtração.

    Ovflow: Overflow port map (lX(11), SeletorY, lS(11), OverflowReal); --Port map do overflow com os bits mais significativos.

    u_teste : process
    begin
        lCinC2 <= '0';        
          lCin <= '0';
     lCinSubtr <= '0';
        
            lX <= x"000";
            lY <= x"FFF";
    SelSomaSub <= '0';
        wait for 192 ns;

            lX <= x"000";
            lY <= x"FFF";
    SelSomaSub <= '1';
        wait for 192 ns;

            lX <= x"FFF";
            lY <= x"001";
    SelSomaSub <= '0';
        wait for 192 ns;

            lX <= x"FFF";
            lY <= x"001";
    SelSomaSub <= '1';
        wait for 192 ns;

            lX <= x"FFE";
            lY <= x"FFE";
    SelSomaSub <= '0';
        wait for 192 ns;

            lX <= x"0FF";
            lY <= x"0FF";
    SelSomaSub <= '0';
        wait for 192 ns;

            lX <= x"FFF";
            lY <= x"FFF";
    SelSomaSub <= '0';
        wait for 192 ns;
        
        wait;
    end process;
 
end architecture;
