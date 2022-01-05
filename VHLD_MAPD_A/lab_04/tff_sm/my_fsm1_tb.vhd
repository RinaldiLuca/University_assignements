library ieee;
use ieee.std_logic_1164.all;

entity my_fsm1_tb is
end entity my_fsm1_tb;

architecture tb of my_fsm1_tb is
  component my_fsm1 is
    port (
      TOG_EN, CLK, CLR : in std_logic;
      Z1               : out std_logic);
  end component;
  signal TOG_EN, CLK, CLR, Z1 : std_logic;

begin
  DUT : my_fsm1 port map(TOG_EN, CLK, CLR, Z1);

  clock : process is
    begin
      CLK <= '1';
      wait for 5 ns;
      CLK <= '0';
      wait for 5 ns;
    end process clock;

  data : process is
    begin
      TOG_EN <= '0';
      wait for 20 ns;
      --wait until rising_edge(CLK);
      TOG_EN <= '1';
      wait for 10 ns;
      --wait until rising_edge(CLK);
  end process data;

  test : process is
    begin
      CLR <= '1';
      wait for 10 ns;
      wait until rising_edge(CLK);
      CLR <= '0';
      wait;
  end process;
end architecture tb;
