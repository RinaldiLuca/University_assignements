library ieee;
use ieee.std_logic_1164.all;

entity or_gate is
  port(
  a : in std_logic;
  b : in std_logic;
  q : out std_logic);
end entity or_gate;

architecture rt1 of or_gate is
begin
  process(a,b) is
  begin
      q <= a or b;
  end process;
end architecture rt1;
