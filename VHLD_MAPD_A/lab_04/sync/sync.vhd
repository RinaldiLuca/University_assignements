library IEEE;
use IEEE.std_logic_1164.all;

entity sync is
  port (
    INPUT   : in std_logic;
    clk     : in std_logic;
    sync_IN : out std_logic);
end sync;

architecture rtl of sync is
  component dff is
    port (
    clk : in std_logic;
    rst : in std_logic;
    d   : in std_logic;
    q   : out std_logic);
  end component dff;
  signal internal : std_logic;
  signal rst : std_logic := '1';

begin
  d1 : dff
    port map(clk,rst,INPUT,internal);

  d2 : dff
    port map(clk,rst,internal,sync_IN);

end architecture rtl;
