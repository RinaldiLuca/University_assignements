library ieee;
use ieee.std_logic_1164.all;

entity mux4_tb is
end entity;

architecture tb of mux4_tb is
  component mux4 is
   port(
     a1, a2, a3, a4 : in std_logic_vector(2 downto 0);
     sel            : in std_logic_vector(1 downto 0);
     b              : out std_logic_vector(2 downto 0));
  end component mux4;
  signal a1, a2, a3, a4, b : std_logic_vector(2 downto 0);
  signal sel : std_logic_vector(1 downto 0);

begin
  DUT : mux4 port map(a1, a2, a3, a4, sel, b);
  process
  begin
    a1 <= B"001"; a2 <= B"010"; a3 <= B"100"; a4 <= B"011";
    sel <= B"00";
    wait for 1 ns;
    sel <= B"01";
    wait for 1 ns;
    sel <= B"10";
    wait for 1 ns;
    sel <= B"11";
    wait for 1 ns;
    wait;
  end process;
end tb;
