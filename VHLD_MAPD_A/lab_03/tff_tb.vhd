library ieee;
use ieee.std_logic_1164.all;

entity tff_tb is
end entity tff_tb;

architecture tb of tff_tb is
  --component tff is
    --port (
    --clk : in std_logic;
    --rst : in std_logic;
    --t   : in std_logic;
    --q   : out std_logic);
  --end component tff;
  signal clk, rst, t, q : std_logic;

begin
  --DUT : tff port map(clk, rst, t, q);
  DUT : entity work.tff
    port map(clk,rst,t,q);

  clock: process is
  begin
    clk <= '1';
    wait for 5 ns;
    clk <= '0';
    wait for 5 ns;
  end process clock;

  data: process is
  begin
    t <= '0';
    wait for 20 ns;
    wait until rising_edge(clk);
    t <= '1';
    --wait for 10 ns;
    wait until rising_edge(clk);

  end process data;

  test: process is
  begin
    rst <= '0';
    wait for 10 ns;
    wait until rising_edge(clk);
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
