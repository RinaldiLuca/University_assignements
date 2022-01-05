library ieee;
use ieee.std_logic_1164.all;

entity patterndetect_tb is
end entity patterndetect_tb;

architecture tb of patterndetect_tb is
  component patterndetect is
    port (
      a, clk, rst : in std_logic;
      y           : out std_logic);
  end component;
  signal a, clk, rst, y : std_logic;

begin
  DUT : patterndetect port map(a, clk, rst, y);

  clock : process is
    begin
      clk <= '1';
      wait for 5 ns;
      clk <= '0';
      wait for 5 ns;
    end process clock;

  data : process is
    begin
      a <= '0';
      wait for 45 ns;
      wait until rising_edge(clk);
      a <= '1';
      wait until rising_edge(clk);
      a <= '0';
      wait until rising_edge(clk);
      a <= '1';
      wait;
    end process;

  test : process is
    begin
      rst <= '1';
      wait for 10 ns;
      wait until rising_edge(clk);
      rst <= '0';
      wait until rising_edge(clk);
      rst <= '1';
      wait;
    end process;
end architecture tb;
