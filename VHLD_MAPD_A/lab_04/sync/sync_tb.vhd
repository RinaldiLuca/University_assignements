library ieee;
use ieee.std_logic_1164.all;

entity sync_tb is
end entity;

architecture tb of sync_tb is
  component sync is
    port (
      INPUT   : in std_logic;
      clk     : in std_logic;
      sync_IN : out std_logic);
  end component sync;
  signal INPUT, clk, internal, sync_IN : std_logic;

begin
  DUT : sync port map(INPUT,clk,sync_IN);

  clock: process is
  begin
    clk <= '1';
    wait for 5 ns;
    clk <= '0';
    wait for 5 ns;
  end process clock;

  test : process is
  begin
    INPUT <= '0';
    wait for 18 ns;
    INPUT <= '1';
    wait for 20 ns;
    INPUT <= '0';
    wait for 10 ns;
    INPUT <= '1';
    wait for 5 ns;
    INPUT <= '0';
    wait for 5 ns;
    INPUT <= '1';
    wait for 5 ns;
    INPUT <= '0';
    wait;
  end process test;
end architecture tb;
