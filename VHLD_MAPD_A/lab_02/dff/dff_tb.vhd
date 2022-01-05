library ieee;
use ieee.std_logic_1164.all;

entity dff_tb is
end entity dff_tb;

architecture tb of dff_tb is
  component dff is
    port (
    clk : in std_logic;
    rst : in std_logic;
    d   : in std_logic;
    q   : out std_logic);
  end component dff;
  signal clk, rst, d, q : std_logic;

begin
  DUT : dff port map(clk, rst, d, q);
  --DUT : entity work.dff
    --port map(clk, rst, d, q);
  clock: process is
  begin
    clk <= '1';
    wait for 10 ns;
    clk <= '0';
    wait for 10 ns;
  end process clock;

  data: process is
  begin
    d <= '1';
    wait for 40 ns;
    wait until rising_edge(clk);
    --wait for 3 ns;
    d <= '0';
    wait for 40 ns;
    wait until rising_edge(clk);
    --wait for 3 ns;
  end process data;

  test: process is
  begin
    rst <= '1';
    --wait for 50 ns;
    --rst <= '0';
    --wait for 10 ns;
    wait;
    -----
    --d <= '0';
    --wait for 40 ns;
    --d <= '1';
    --wait for 40 ns;
  end process;
end architecture tb;
