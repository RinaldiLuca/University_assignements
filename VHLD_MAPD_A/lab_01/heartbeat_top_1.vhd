library ieee;
use ieee.std_logic_1164.all;

entity heartbeat_top_1 is
end heartbeat_top_1;

architecture str of heartbeat_top_1 is
  component heartbeat is
    port (
      A : out std_logic);
  end component heartbeat;
  signal B : std_logic;
begin
  DUT: entity work.heartbeat
    port map (B);
    end architecture str;
