library ieee;
use ieee.std_logic_1164.all;

entity heartbeat_top is
end heartbeat_top;

architecture str of heartbeat_top is
  component heartbeat is
    port (
      clk : out std_logic);
  end component heartbeat;
  signal clk : std_logic;
begin
  DUT: entity work.heartbeat
    port map (
      clk => clk);
    end architecture str;
